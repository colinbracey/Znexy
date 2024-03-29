import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({super.key});

  @override
  State<AllChatsPageWidget> createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF142328),
        automaticallyImplyLeading: false,
        title: Text(
          'All Chats',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Comfortaa',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 22.0,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where(
                    'users',
                    arrayContains: currentUserReference,
                  )
                  .orderBy('last_message_time', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFF609F0),
                      ),
                    ),
                  ),
                );
              }
              List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
              if (listViewChatsRecordList.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/54856ab427f28a0b40b1a305792a3b00.png',
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: StreamBuilder<FFChatInfo>(
                      stream: FFChatManager.instance
                          .getChatInfo(chatRecord: listViewChatsRecord),
                      builder: (context, snapshot) {
                        final chatInfo =
                            snapshot.data ?? FFChatInfo(listViewChatsRecord);
                        return FFChatPreview(
                          onTap: () => context.pushNamed(
                            'ChatPage',
                            queryParameters: {
                              'chatUser': serializeParam(
                                chatInfo.otherUsers.length == 1
                                    ? chatInfo.otherUsersList.first
                                    : null,
                                ParamType.Document,
                              ),
                              'chatRef': serializeParam(
                                chatInfo.chatRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chatUser': chatInfo.otherUsers.length == 1
                                  ? chatInfo.otherUsersList.first
                                  : null,
                            },
                          ),
                          lastChatText: chatInfo.chatPreviewMessage(),
                          lastChatTime: listViewChatsRecord.lastMessageTime,
                          seen: listViewChatsRecord.lastMessageSeenBy.contains(currentUserReference),
                          title: chatInfo.chatPreviewTitle(),
                          userProfilePic: chatInfo.chatPreviewPic(),
                          color: const Color(0xFFEEF0F5),
                          unreadColor: const Color(0xFFCC0E3A),
                          titleTextStyle: GoogleFonts.getFont(
                            'DM Sans',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          dateTextStyle: GoogleFonts.getFont(
                            'DM Sans',
                            color: const Color(0x73000000),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                          previewTextStyle: GoogleFonts.getFont(
                            'DM Sans',
                            color: const Color(0x73000000),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                          contentPadding: const EdgeInsets.all(3.0),
                          borderRadius: BorderRadius.circular(0.0),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

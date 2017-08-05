; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp101 = icmp sgt i32 %n, 0
  br i1 %cmp101, label %for.body.preheader, label %entry.for.end46.thread_crit_edge

entry.for.end46.thread_crit_edge:                 ; preds = %entry
  br label %for.end46.thread

for.body.preheader:                               ; preds = %entry
  %0 = and i32 %n, 1
  %lcmp.mod162 = icmp eq i32 %0, 0
  br i1 %lcmp.mod162, label %for.body.preheader.for.body.prol.loopexit_crit_edge, label %for.body.prol

for.body.preheader.for.body.prol.loopexit_crit_edge: ; preds = %for.body.preheader
  br label %for.body.prol.loopexit

for.body.prol:                                    ; preds = %for.body.preheader
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader.for.body.prol.loopexit_crit_edge, %for.body.prol
  %indvars.iv150.unr = phi i64 [ 0, %for.body.preheader.for.body.prol.loopexit_crit_edge ], [ 1, %for.body.prol ]
  %1 = icmp eq i32 %n, 1
  br i1 %1, label %for.body.prol.loopexit.for.cond13.preheader.preheader_crit_edge, label %for.body.preheader174

for.body.prol.loopexit.for.cond13.preheader.preheader_crit_edge: ; preds = %for.body.prol.loopexit
  br label %for.cond13.preheader.preheader

for.body.preheader174:                            ; preds = %for.body.prol.loopexit
  %wide.trip.count152.1 = zext i32 %n to i64
  %2 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.cond9.preheader:                              ; preds = %for.body
  %cmp1099 = icmp sgt i32 %n, 0
  br i1 %cmp1099, label %for.cond9.preheader.for.cond13.preheader.preheader_crit_edge, label %for.cond9.preheader.for.end46.thread_crit_edge

for.cond9.preheader.for.end46.thread_crit_edge:   ; preds = %for.cond9.preheader
  br label %for.end46.thread

for.cond9.preheader.for.cond13.preheader.preheader_crit_edge: ; preds = %for.cond9.preheader
  br label %for.cond13.preheader.preheader

for.cond13.preheader.preheader:                   ; preds = %for.cond9.preheader.for.cond13.preheader.preheader_crit_edge, %for.body.prol.loopexit.for.cond13.preheader.preheader_crit_edge
  %3 = add i32 %n, -2
  %4 = zext i32 %3 to i64
  %5 = sext i32 %n to i64
  %wide.trip.count148 = zext i32 %n to i64
  br label %for.body16.lr.ph

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader174
  %indvars.iv150 = phi i64 [ %indvars.iv.next151.1, %for.body.for.body_crit_edge ], [ %indvars.iv150.unr, %for.body.preheader174 ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv150
  %6 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv150
  %7 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %8 = trunc i64 %indvars.iv.next151 to i32
  %conv4 = sitofp i32 %8 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv150
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %indvars.iv.next151.1 = add nuw nsw i64 %indvars.iv150, 2
  %9 = trunc i64 %indvars.iv.next151.1 to i32
  %conv4.1 = sitofp i32 %9 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %10 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %10, align 8
  %exitcond153.1 = icmp eq i64 %indvars.iv.next151.1, %wide.trip.count152.1
  br i1 %exitcond153.1, label %for.cond9.preheader, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

for.body16.lr.ph:                                 ; preds = %for.end39.for.body16.lr.ph_crit_edge, %for.cond13.preheader.preheader
  %indvars.iv146 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next147, %for.end39.for.body16.lr.ph_crit_edge ]
  %indvars.iv144 = phi i64 [ 1, %for.cond13.preheader.preheader ], [ %indvars.iv.next145, %for.end39.for.body16.lr.ph_crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv146, 2001
  %12 = sub i64 %4, %indvars.iv146
  %13 = shl i64 %12, 3
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.lr.ph
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.lr.ph ]
  %14 = sub nsw i64 0, %indvars.iv129
  %15 = trunc i64 %14 to i32
  %rem = srem i32 %15, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv146, i64 %indvars.iv129
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next130, %indvars.iv144
  br i1 %exitcond135, label %for.end27, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.end27:                                        ; preds = %for.body16
  %16 = add nuw nsw i64 %11, 1
  %17 = and i64 %13, 34359738360
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %16
  %18 = add nuw nsw i64 %17, 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %cmp3097 = icmp slt i64 %indvars.iv.next147, %5
  br i1 %cmp3097, label %for.end39.loopexit, label %for.end27.for.end39_crit_edge

for.end27.for.end39_crit_edge:                    ; preds = %for.end27
  br label %for.end39

for.end39.loopexit:                               ; preds = %for.end27
  %19 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %19, i8 0, i64 %18, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.end27.for.end39_crit_edge, %for.end39.loopexit
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv146, i64 %indvars.iv146
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond149 = icmp eq i64 %indvars.iv.next147, %wide.trip.count148
  br i1 %exitcond149, label %for.end46, label %for.end39.for.body16.lr.ph_crit_edge

for.end39.for.body16.lr.ph_crit_edge:             ; preds = %for.end39
  br label %for.body16.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader.for.end46.thread_crit_edge, %entry.for.end46.thread_crit_edge
  %call166 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %cmp4893 = icmp sgt i32 %n, 0
  br i1 %cmp4893, label %for.cond51.preheader.us.preheader, label %for.end46.for.end120_crit_edge

for.end46.for.end120_crit_edge:                   ; preds = %for.end46
  br label %for.end120

for.cond51.preheader.us.preheader:                ; preds = %for.end46
  %20 = add i32 %n, -1
  %21 = zext i32 %20 to i64
  %22 = shl nuw nsw i64 %21, 3
  %23 = add nuw nsw i64 %22, 8
  %24 = zext i32 %n to i64
  %25 = add nsw i64 %24, -1
  %xtraiter158 = and i64 %24, 3
  %lcmp.mod159 = icmp eq i64 %xtraiter158, 0
  br i1 %lcmp.mod159, label %for.cond51.preheader.us.preheader.for.cond51.preheader.us.prol.loopexit_crit_edge, label %for.cond51.for.inc62_crit_edge.us.prol.preheader

for.cond51.preheader.us.preheader.for.cond51.preheader.us.prol.loopexit_crit_edge: ; preds = %for.cond51.preheader.us.preheader
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.for.inc62_crit_edge.us.prol.preheader: ; preds = %for.cond51.preheader.us.preheader
  br label %for.cond51.for.inc62_crit_edge.us.prol

for.cond51.for.inc62_crit_edge.us.prol:           ; preds = %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge, %for.cond51.for.inc62_crit_edge.us.prol.preheader
  %indvars.iv125.prol = phi i64 [ %indvars.iv.next126.prol, %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge ], [ 0, %for.cond51.for.inc62_crit_edge.us.prol.preheader ]
  %prol.iter160 = phi i64 [ %prol.iter160.sub, %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge ], [ %xtraiter158, %for.cond51.for.inc62_crit_edge.us.prol.preheader ]
  %26 = mul nuw nsw i64 %indvars.iv125.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next126.prol = add nuw nsw i64 %indvars.iv125.prol, 1
  %prol.iter160.sub = add nsw i64 %prol.iter160, -1
  %prol.iter160.cmp = icmp eq i64 %prol.iter160.sub, 0
  br i1 %prol.iter160.cmp, label %for.cond51.preheader.us.prol.loopexit.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge: ; preds = %for.cond51.for.inc62_crit_edge.us.prol
  br label %for.cond51.for.inc62_crit_edge.us.prol

for.cond51.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond51.for.inc62_crit_edge.us.prol
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.preheader.us.prol.loopexit:            ; preds = %for.cond51.preheader.us.preheader.for.cond51.preheader.us.prol.loopexit_crit_edge, %for.cond51.preheader.us.prol.loopexit.loopexit
  %indvars.iv125.unr = phi i64 [ 0, %for.cond51.preheader.us.preheader.for.cond51.preheader.us.prol.loopexit_crit_edge ], [ %xtraiter158, %for.cond51.preheader.us.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %25, 3
  br i1 %27, label %for.cond51.preheader.us.prol.loopexit.for.cond65.preheader_crit_edge, label %for.cond51.for.inc62_crit_edge.us.3.preheader

for.cond51.preheader.us.prol.loopexit.for.cond65.preheader_crit_edge: ; preds = %for.cond51.preheader.us.prol.loopexit
  br label %for.cond65.preheader

for.cond51.for.inc62_crit_edge.us.3.preheader:    ; preds = %for.cond51.preheader.us.prol.loopexit
  %wide.trip.count127.3 = zext i32 %n to i64
  %28 = add nsw i64 %wide.trip.count127.3, -4
  %29 = sub i64 %28, %indvars.iv125.unr
  %30 = lshr i64 %29, 2
  %31 = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %31, 0
  br i1 %lcmp.mod, label %for.cond51.for.inc62_crit_edge.us.3.prol.preheader, label %for.cond51.for.inc62_crit_edge.us.3.preheader.for.cond51.for.inc62_crit_edge.us.3.prol.loopexit_crit_edge

for.cond51.for.inc62_crit_edge.us.3.preheader.for.cond51.for.inc62_crit_edge.us.3.prol.loopexit_crit_edge: ; preds = %for.cond51.for.inc62_crit_edge.us.3.preheader
  br label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit

for.cond51.for.inc62_crit_edge.us.3.prol.preheader: ; preds = %for.cond51.for.inc62_crit_edge.us.3.preheader
  br label %for.cond51.for.inc62_crit_edge.us.3.prol

for.cond51.for.inc62_crit_edge.us.3.prol:         ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.preheader
  %32 = mul nuw nsw i64 %indvars.iv125.unr, 16000
  %scevgep.prol180 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol180, i8 0, i64 %23, i32 8, i1 false)
  %33 = mul i64 %indvars.iv125.unr, 16000
  %34 = add i64 %33, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %35 = mul i64 %indvars.iv125.unr, 16000
  %36 = add i64 %35, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %37 = mul i64 %indvars.iv125.unr, 16000
  %38 = add i64 %37, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next126.3.prol = add nsw i64 %indvars.iv125.unr, 4
  br label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit

for.cond51.for.inc62_crit_edge.us.3.prol.loopexit: ; preds = %for.cond51.for.inc62_crit_edge.us.3.preheader.for.cond51.for.inc62_crit_edge.us.3.prol.loopexit_crit_edge, %for.cond51.for.inc62_crit_edge.us.3.prol
  %indvars.iv125.unr181 = phi i64 [ %indvars.iv125.unr, %for.cond51.for.inc62_crit_edge.us.3.preheader.for.cond51.for.inc62_crit_edge.us.3.prol.loopexit_crit_edge ], [ %indvars.iv.next126.3.prol, %for.cond51.for.inc62_crit_edge.us.3.prol ]
  %39 = icmp eq i64 %30, 0
  br i1 %39, label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit.for.cond65.preheader.loopexit_crit_edge, label %for.cond51.for.inc62_crit_edge.us.3.preheader.new

for.cond51.for.inc62_crit_edge.us.3.prol.loopexit.for.cond65.preheader.loopexit_crit_edge: ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit
  br label %for.cond65.preheader.loopexit

for.cond51.for.inc62_crit_edge.us.3.preheader.new: ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit
  br label %for.cond51.for.inc62_crit_edge.us.3

for.cond65.preheader.loopexit.unr-lcssa:          ; preds = %for.cond51.for.inc62_crit_edge.us.3
  br label %for.cond65.preheader.loopexit

for.cond65.preheader.loopexit:                    ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit.for.cond65.preheader.loopexit_crit_edge, %for.cond65.preheader.loopexit.unr-lcssa
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond51.preheader.us.prol.loopexit.for.cond65.preheader_crit_edge, %for.cond65.preheader.loopexit
  %cmp6669 = icmp sgt i32 %n, 0
  br i1 %cmp6669, label %for.cond73.preheader.us.us.preheader.preheader, label %for.cond65.preheader.for.end120_crit_edge

for.cond65.preheader.for.end120_crit_edge:        ; preds = %for.cond65.preheader
  br label %for.end120

for.cond73.preheader.us.us.preheader.preheader:   ; preds = %for.cond65.preheader
  %40 = and i32 %n, 1
  %wide.trip.count115 = zext i32 %n to i64
  %wide.trip.count111.1 = zext i32 %n to i64
  %wide.trip.count119 = zext i32 %n to i64
  %41 = icmp eq i32 %40, 0
  %42 = icmp eq i32 %n, 1
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %44 = bitcast i8* %call to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %A to i64
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond69.for.inc96_crit_edge.us.for.cond73.preheader.us.us.preheader_crit_edge, %for.cond73.preheader.us.us.preheader.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.cond69.for.inc96_crit_edge.us.for.cond73.preheader.us.us.preheader_crit_edge ], [ 0, %for.cond73.preheader.us.us.preheader.preheader ]
  %sunkaddr175 = shl i64 %indvars.iv117, 3
  %sunkaddr176 = add i64 %sunkaddr, %sunkaddr175
  %sunkaddr177 = inttoptr i64 %sunkaddr176 to double*
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, %wide.trip.count119
  br i1 %exitcond120, label %for.cond99.preheader, label %for.cond69.for.inc96_crit_edge.us.for.cond73.preheader.us.us.preheader_crit_edge

for.cond69.for.inc96_crit_edge.us.for.cond73.preheader.us.us.preheader_crit_edge: ; preds = %for.cond69.for.inc96_crit_edge.us
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us.for.cond73.preheader.us.us_crit_edge, %for.cond73.preheader.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next114, %for.cond73.for.inc93_crit_edge.us.us.for.cond73.preheader.us.us_crit_edge ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv117
  br i1 %41, label %for.cond73.preheader.us.us.for.body76.us.us.prol.loopexit_crit_edge, label %for.body76.us.us.prol

for.cond73.preheader.us.us.for.body76.us.us.prol.loopexit_crit_edge: ; preds = %for.cond73.preheader.us.us
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol:                            ; preds = %for.cond73.preheader.us.us
  %45 = load double, double* %arrayidx80.us.us, align 8
  %46 = load double, double* %sunkaddr177, align 8
  %mul.us.us.prol = fmul double %45, %46
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv113, i64 0
  %47 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %47, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.cond73.preheader.us.us.for.body76.us.us.prol.loopexit_crit_edge, %for.body76.us.us.prol
  %indvars.iv109.unr.ph = phi i64 [ 1, %for.body76.us.us.prol ], [ 0, %for.cond73.preheader.us.us.for.body76.us.us.prol.loopexit_crit_edge ]
  br i1 %42, label %for.body76.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge, label %for.body76.us.us.preheader

for.body76.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge: ; preds = %for.body76.us.us.prol.loopexit
  br label %for.cond73.for.inc93_crit_edge.us.us

for.body76.us.us.preheader:                       ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body76.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.body76.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge, %for.cond73.for.inc93_crit_edge.us.us.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, %wide.trip.count115
  br i1 %exitcond116, label %for.cond69.for.inc96_crit_edge.us, label %for.cond73.for.inc93_crit_edge.us.us.for.cond73.preheader.us.us_crit_edge

for.cond73.for.inc93_crit_edge.us.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.cond73.for.inc93_crit_edge.us.us
  br label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.body76.us.us.preheader
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.1, %for.body76.us.us.for.body76.us.us_crit_edge ], [ %indvars.iv109.unr.ph, %for.body76.us.us.preheader ]
  %48 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv109, i64 %indvars.iv117
  %49 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv113, i64 %indvars.iv109
  %50 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %50, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %51 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv117
  %52 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next110
  %53 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %53, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next110.1 = add nuw nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, %wide.trip.count111.1
  br i1 %exitcond112.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body76.us.us.for.body76.us.us_crit_edge

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  br label %for.body76.us.us

for.cond99.preheader:                             ; preds = %for.cond69.for.inc96_crit_edge.us
  %cmp10063 = icmp sgt i32 %n, 0
  br i1 %cmp10063, label %for.cond103.preheader.us.preheader, label %for.cond99.preheader.for.end120_crit_edge

for.cond99.preheader.for.end120_crit_edge:        ; preds = %for.cond99.preheader
  br label %for.end120

for.cond103.preheader.us.preheader:               ; preds = %for.cond99.preheader
  %54 = zext i32 %n to i64
  %55 = add nsw i64 %54, -1
  %xtraiter = and i64 %54, 3
  %wide.trip.count107 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %n to i64
  %56 = icmp eq i64 %xtraiter, 0
  %57 = icmp ult i64 %55, 3
  %58 = bitcast i8* %call to [2000 x [2000 x double]]*
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.cond103.for.inc118_crit_edge.us.for.cond103.preheader.us_crit_edge, %for.cond103.preheader.us.preheader
  %indvars.iv105 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next106, %for.cond103.for.inc118_crit_edge.us.for.cond103.preheader.us_crit_edge ]
  br i1 %56, label %for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge, label %for.body106.us.prol.preheader

for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge: ; preds = %for.cond103.preheader.us
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.preheader:                    ; preds = %for.cond103.preheader.us
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol.for.body106.us.prol_crit_edge, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol.for.body106.us.prol_crit_edge ], [ 0, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol.for.body106.us.prol_crit_edge ], [ %xtraiter, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv105, i64 %indvars.iv.prol
  %60 = bitcast double* %arrayidx110.us.prol to i64*
  %61 = load i64, i64* %60, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv.prol
  %62 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %61, i64* %62, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol.for.body106.us.prol_crit_edge, !llvm.loop !3

for.body106.us.prol.for.body106.us.prol_crit_edge: ; preds = %for.body106.us.prol
  br label %for.body106.us.prol

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge, %for.body106.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge ], [ %xtraiter, %for.body106.us.prol.loopexit.loopexit ]
  br i1 %57, label %for.body106.us.prol.loopexit.for.cond103.for.inc118_crit_edge.us_crit_edge, label %for.body106.us.preheader

for.body106.us.prol.loopexit.for.cond103.for.inc118_crit_edge.us_crit_edge: ; preds = %for.body106.us.prol.loopexit
  br label %for.cond103.for.inc118_crit_edge.us

for.body106.us.preheader:                         ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.body106.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body106.us.for.body106.us_crit_edge ], [ %indvars.iv.unr, %for.body106.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv105, i64 %indvars.iv
  %63 = bitcast double* %arrayidx110.us to i64*
  %64 = load i64, i64* %63, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv
  %65 = bitcast double* %arrayidx114.us to i64*
  store i64 %64, i64* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next
  %66 = bitcast double* %arrayidx110.us.1 to i64*
  %67 = load i64, i64* %66, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv.next
  %68 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %67, i64* %68, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %69 = bitcast double* %arrayidx110.us.2 to i64*
  %70 = load i64, i64* %69, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %71 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %70, i64* %71, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %72 = bitcast double* %arrayidx110.us.3 to i64*
  %73 = load i64, i64* %72, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %74 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.body106.us.for.body106.us_crit_edge

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  br label %for.body106.us

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.body106.us
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.body106.us.prol.loopexit.for.cond103.for.inc118_crit_edge.us_crit_edge, %for.cond103.for.inc118_crit_edge.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %wide.trip.count107
  br i1 %exitcond108, label %for.end120.loopexit, label %for.cond103.for.inc118_crit_edge.us.for.cond103.preheader.us_crit_edge

for.cond103.for.inc118_crit_edge.us.for.cond103.preheader.us_crit_edge: ; preds = %for.cond103.for.inc118_crit_edge.us
  br label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.cond103.for.inc118_crit_edge.us
  br label %for.end120

for.end120:                                       ; preds = %for.cond99.preheader.for.end120_crit_edge, %for.cond65.preheader.for.end120_crit_edge, %for.end46.for.end120_crit_edge, %for.end120.loopexit, %for.end46.thread
  %call168170173 = phi i8* [ %call, %for.cond99.preheader.for.end120_crit_edge ], [ %call, %for.cond65.preheader.for.end120_crit_edge ], [ %call, %for.end46.for.end120_crit_edge ], [ %call166, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call168170173) #4
  ret void

for.cond51.for.inc62_crit_edge.us.3:              ; preds = %for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge, %for.cond51.for.inc62_crit_edge.us.3.preheader.new
  %indvars.iv125 = phi i64 [ %indvars.iv125.unr181, %for.cond51.for.inc62_crit_edge.us.3.preheader.new ], [ %indvars.iv.next126.3.1, %for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge ]
  %75 = mul nuw nsw i64 %indvars.iv125, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %23, i32 8, i1 false)
  %76 = mul i64 %indvars.iv125, 16000
  %77 = add i64 %76, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %23, i32 8, i1 false)
  %78 = mul i64 %indvars.iv125, 16000
  %79 = add i64 %78, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %79
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %23, i32 8, i1 false)
  %80 = mul i64 %indvars.iv125, 16000
  %81 = add i64 %80, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next126.3 = add nsw i64 %indvars.iv125, 4
  %82 = mul nuw nsw i64 %indvars.iv.next126.3, 16000
  %scevgep.1182 = getelementptr i8, i8* %call, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1182, i8 0, i64 %23, i32 8, i1 false)
  %83 = mul i64 %indvars.iv.next126.3, 16000
  %84 = add i64 %83, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %84
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %23, i32 8, i1 false)
  %85 = mul i64 %indvars.iv.next126.3, 16000
  %86 = add i64 %85, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %86
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %23, i32 8, i1 false)
  %87 = mul i64 %indvars.iv.next126.3, 16000
  %88 = add i64 %87, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %88
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next126.3.1 = add nsw i64 %indvars.iv125, 8
  %exitcond128.3.1 = icmp eq i64 %indvars.iv.next126.3.1, %wide.trip.count127.3
  br i1 %exitcond128.3.1, label %for.cond65.preheader.loopexit.unr-lcssa, label %for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge

for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge: ; preds = %for.cond51.for.inc62_crit_edge.us.3
  br label %for.cond51.for.inc62_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp102 = icmp sgt i32 %n, 0
  br i1 %cmp102, label %for.cond1.preheader.preheader, label %entry.for.end113_crit_edge

entry.for.end113_crit_edge:                       ; preds = %entry
  br label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count143 = zext i32 %n to i64
  %wide.trip.count139 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.preheader ]
  %cmp294 = icmp sgt i64 %indvars.iv141, 0
  br i1 %cmp294, label %for.body3.preheader, label %for.cond1.preheader.for.inc58_crit_edge

for.cond1.preheader.for.inc58_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  %cmp6288 = icmp sgt i32 %n, 0
  br i1 %cmp6288, label %for.body63.preheader, label %for.cond61.preheader.for.end113_crit_edge

for.cond61.preheader.for.end113_crit_edge:        ; preds = %for.cond61.preheader
  br label %for.end113

for.body63.preheader:                             ; preds = %for.cond61.preheader
  %wide.trip.count116 = zext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.end
  %cmp3696 = icmp sgt i64 %indvars.iv141, 0
  br i1 %cmp3696, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc58_crit_edge

for.body30.lr.ph.for.inc58_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter150 = and i64 %indvars.iv141, 1
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 0
  %0 = icmp eq i64 %xtraiter150, 0
  %1 = icmp eq i64 %indvars.iv141, 1
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond35.for.end50_crit_edge.us.for.body30.us_crit_edge, %for.body30.us.preheader
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %for.cond35.for.end50_crit_edge.us.for.body30.us_crit_edge ], [ %indvars.iv141, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv137
  %2 = load double, double* %arrayidx34.us, align 8
  br i1 %0, label %for.body30.us.for.body37.us.prol.loopexit_crit_edge, label %for.body37.us.prol

for.body30.us.for.body37.us.prol.loopexit_crit_edge: ; preds = %for.body30.us
  br label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv137
  %4 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %3, %4
  %sub47.us.prol = fsub double %2, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body30.us.for.body37.us.prol.loopexit_crit_edge, %for.body37.us.prol
  %indvars.iv130.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us.for.body37.us.prol.loopexit_crit_edge ]
  %w.198.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %2, %for.body30.us.for.body37.us.prol.loopexit_crit_edge ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us.for.body37.us.prol.loopexit_crit_edge ]
  br i1 %1, label %for.body37.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge, label %for.body37.us.preheader

for.body37.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge: ; preds = %for.body37.us.prol.loopexit
  br label %for.cond35.for.end50_crit_edge.us

for.body37.us.preheader:                          ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body37.us.preheader
  %indvars.iv130 = phi i64 [ %indvars.iv.next131.1, %for.body37.us.for.body37.us_crit_edge ], [ %indvars.iv130.unr.ph, %for.body37.us.preheader ]
  %w.198.us = phi double [ %sub47.us.1, %for.body37.us.for.body37.us_crit_edge ], [ %w.198.us.unr.ph, %for.body37.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv130
  %5 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv130, i64 %indvars.iv137
  %6 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %7 = load <2 x double>, <2 x double>* %5, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next131, i64 %indvars.iv137
  %8 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %6, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %8, i32 1
  %mul46.us = fmul <2 x double> %7, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.198.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next131.1 = add nuw nsw i64 %indvars.iv130, 2
  %exitcond134.1 = icmp eq i64 %indvars.iv.next131.1, %indvars.iv141
  br i1 %exitcond134.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  br label %for.body37.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.body37.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.body37.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge, %for.cond35.for.end50_crit_edge.us.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %for.inc58.loopexit, label %for.cond35.for.end50_crit_edge.us.for.body30.us_crit_edge

for.cond35.for.end50_crit_edge.us.for.body30.us_crit_edge: ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.body30.us

for.body3:                                        ; preds = %for.end.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.end.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv123
  %9 = load double, double* %arrayidx5, align 8
  %cmp790 = icmp sgt i64 %indvars.iv123, 0
  br i1 %cmp790, label %for.body8.preheader, label %for.body3.for.end_crit_edge

for.body3.for.end_crit_edge:                      ; preds = %for.body3
  br label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %xtraiter148 = and i64 %indvars.iv123, 1
  %lcmp.mod149 = icmp eq i64 %xtraiter148, 0
  br i1 %lcmp.mod149, label %for.body8.preheader.for.body8.prol.loopexit_crit_edge, label %for.body8.prol

for.body8.preheader.for.body8.prol.loopexit_crit_edge: ; preds = %for.body8.preheader
  br label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.preheader
  %10 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv123
  %11 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %10, %11
  %sub.prol = fsub double %9, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.preheader.for.body8.prol.loopexit_crit_edge, %for.body8.prol
  %indvars.iv118.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader.for.body8.prol.loopexit_crit_edge ]
  %w.092.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %9, %for.body8.preheader.for.body8.prol.loopexit_crit_edge ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader.for.body8.prol.loopexit_crit_edge ]
  %12 = icmp eq i64 %indvars.iv123, 1
  br i1 %12, label %for.body8.prol.loopexit.for.end_crit_edge, label %for.body8.preheader167

for.body8.prol.loopexit.for.end_crit_edge:        ; preds = %for.body8.prol.loopexit
  br label %for.end

for.body8.preheader167:                           ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body8.preheader167
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.1, %for.body8.for.body8_crit_edge ], [ %indvars.iv118.unr.ph, %for.body8.preheader167 ]
  %w.092 = phi double [ %sub.1, %for.body8.for.body8_crit_edge ], [ %w.092.unr.ph, %for.body8.preheader167 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv118
  %13 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv123
  %14 = load double, double* %arrayidx16, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %15 = load <2 x double>, <2 x double>* %13, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next119, i64 %indvars.iv123
  %16 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %14, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %16, i32 1
  %mul = fmul <2 x double> %15, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.092, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next119.1 = add nuw nsw i64 %indvars.iv118, 2
  %exitcond122.1 = icmp eq i64 %indvars.iv.next119.1, %indvars.iv123
  br i1 %exitcond122.1, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.body8.prol.loopexit.for.end_crit_edge, %for.body3.for.end_crit_edge, %for.end.loopexit
  %w.0.lcssa = phi double [ %9, %for.body3.for.end_crit_edge ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit.for.end_crit_edge ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv123
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %17
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next124, %indvars.iv141
  br i1 %exitcond128, label %for.body30.lr.ph, label %for.end.for.body3_crit_edge

for.end.for.body3_crit_edge:                      ; preds = %for.end
  br label %for.body3

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.body30.lr.ph.for.inc58_crit_edge, %for.cond1.preheader.for.inc58_crit_edge, %for.inc58.loopexit
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next142, %wide.trip.count143
  br i1 %exitcond144, label %for.cond61.preheader, label %for.inc58.for.cond1.preheader_crit_edge

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  br label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.end79
  %cmp8782 = icmp sgt i32 %n, 0
  br i1 %cmp8782, label %for.body88.preheader, label %for.cond86.preheader.for.end113_crit_edge

for.cond86.preheader.for.end113_crit_edge:        ; preds = %for.cond86.preheader
  br label %for.end113

for.body88.preheader:                             ; preds = %for.cond86.preheader
  %18 = sext i32 %n to i64
  %19 = sext i32 %n to i64
  %20 = add i64 %18, 1
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body63:                                       ; preds = %for.end79.for.body63_crit_edge, %for.body63.preheader
  %indvars.iv171 = phi i2 [ 0, %for.body63.preheader ], [ %indvars.iv.next172, %for.end79.for.body63_crit_edge ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %21 = zext i2 %indvars.iv171 to i64
  %22 = add nsw i64 %indvars.iv114, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv114
  %23 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv114, 0
  br i1 %cmp6784, label %for.body68.preheader, label %for.body63.for.end79_crit_edge

for.body63.for.end79_crit_edge:                   ; preds = %for.body63
  br label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %xtraiter145 = and i64 %indvars.iv114, 3
  %lcmp.mod146 = icmp eq i64 %xtraiter145, 0
  br i1 %lcmp.mod146, label %for.body68.preheader.for.body68.prol.loopexit_crit_edge, label %for.body68.prol.preheader

for.body68.preheader.for.body68.prol.loopexit_crit_edge: ; preds = %for.body68.preheader
  br label %for.body68.prol.loopexit

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.for.body68.prol_crit_edge, %for.body68.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body68.prol.for.body68.prol_crit_edge ], [ 0, %for.body68.prol.preheader ]
  %w.286.prol = phi double [ %sub76.prol, %for.body68.prol.for.body68.prol_crit_edge ], [ %23, %for.body68.prol.preheader ]
  %prol.iter147 = phi i64 [ %prol.iter147.sub, %for.body68.prol.for.body68.prol_crit_edge ], [ %xtraiter145, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv.prol
  %24 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %25 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %24, %25
  %sub76.prol = fsub double %w.286.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter147.sub = add nsw i64 %prol.iter147, -1
  %prol.iter147.cmp = icmp eq i64 %prol.iter147.sub, 0
  br i1 %prol.iter147.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol.for.body68.prol_crit_edge, !llvm.loop !4

for.body68.prol.for.body68.prol_crit_edge:        ; preds = %for.body68.prol
  br label %for.body68.prol

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.preheader.for.body68.prol.loopexit_crit_edge, %for.body68.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.body68.preheader.for.body68.prol.loopexit_crit_edge ], [ %21, %for.body68.prol.loopexit.loopexit ]
  %w.286.unr = phi double [ %23, %for.body68.preheader.for.body68.prol.loopexit_crit_edge ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader.for.body68.prol.loopexit_crit_edge ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %22, 3
  br i1 %26, label %for.body68.prol.loopexit.for.end79_crit_edge, label %for.body68.preheader166

for.body68.prol.loopexit.for.end79_crit_edge:     ; preds = %for.body68.prol.loopexit
  br label %for.end79

for.body68.preheader166:                          ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.for.body68_crit_edge, %for.body68.preheader166
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body68.for.body68_crit_edge ], [ %indvars.iv.unr, %for.body68.preheader166 ]
  %w.286 = phi double [ %sub76.3, %for.body68.for.body68_crit_edge ], [ %w.286.unr, %for.body68.preheader166 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv
  %27 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %28 = bitcast double* %arrayidx74 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %27, align 8
  %30 = load <2 x double>, <2 x double>* %28, align 8
  %mul75 = fmul <2 x double> %29, %30
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.286, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv.next.1
  %31 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx74.2 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %mul75.2 = fmul <2 x double> %33, %34
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond113.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv114
  br i1 %exitcond113.3, label %for.end79.loopexit, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  br label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.body68.prol.loopexit.for.end79_crit_edge, %for.body63.for.end79_crit_edge, %for.end79.loopexit
  %w.2.lcssa = phi double [ %23, %for.body63.for.end79_crit_edge ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit.for.end79_crit_edge ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv114
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  %indvars.iv.next172 = add i2 %indvars.iv171, 1
  br i1 %exitcond117, label %for.cond86.preheader, label %for.end79.for.body63_crit_edge

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  br label %for.body63

for.body88:                                       ; preds = %for.end104.for.body88_crit_edge, %for.body88.preheader
  %indvars.iv169 = phi i2 [ 0, %for.body88.preheader ], [ %indvars.iv.next170, %for.end104.for.body88_crit_edge ]
  %indvars.iv168 = phi i64 [ %20, %for.body88.preheader ], [ %indvars.iv.next, %for.end104.for.body88_crit_edge ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104.for.body88_crit_edge ]
  %indvars.iv109 = phi i64 [ %18, %for.body88.preheader ], [ %indvars.iv.next110, %for.end104.for.body88_crit_edge ]
  %35 = zext i2 %indvars.iv169 to i32
  %36 = add i32 %35, -1
  %37 = zext i32 %36 to i64
  %38 = add i64 %indvars.iv168, %37
  %39 = add nsw i32 %indvar, -1
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next110
  %40 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv109, %19
  br i1 %cmp9278, label %for.body93.preheader, label %for.body88.for.end104_crit_edge

for.body88.for.end104_crit_edge:                  ; preds = %for.body88
  br label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.preheader.for.body93.prol.loopexit_crit_edge, label %for.body93.prol.preheader

for.body93.preheader.for.body93.prol.loopexit_crit_edge: ; preds = %for.body93.preheader
  br label %for.body93.prol.loopexit

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.for.body93.prol_crit_edge, %for.body93.prol.preheader
  %indvars.iv107.prol = phi i64 [ %indvars.iv.next108.prol, %for.body93.prol.for.body93.prol_crit_edge ], [ %indvars.iv109, %for.body93.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.body93.prol.for.body93.prol_crit_edge ], [ %40, %for.body93.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body93.prol.for.body93.prol_crit_edge ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv107.prol
  %41 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv107.prol
  %42 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %41, %42
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next108.prol = add nsw i64 %indvars.iv107.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol.for.body93.prol_crit_edge, !llvm.loop !5

for.body93.prol.for.body93.prol_crit_edge:        ; preds = %for.body93.prol
  br label %for.body93.prol

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.preheader.for.body93.prol.loopexit_crit_edge, %for.body93.prol.loopexit.loopexit
  %indvars.iv107.unr = phi i64 [ %indvars.iv109, %for.body93.preheader.for.body93.prol.loopexit_crit_edge ], [ %38, %for.body93.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %40, %for.body93.preheader.for.body93.prol.loopexit_crit_edge ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader.for.body93.prol.loopexit_crit_edge ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %43 = icmp ult i32 %39, 3
  br i1 %43, label %for.body93.prol.loopexit.for.end104_crit_edge, label %for.body93.preheader165

for.body93.prol.loopexit.for.end104_crit_edge:    ; preds = %for.body93.prol.loopexit
  br label %for.end104

for.body93.preheader165:                          ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body93.preheader165
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.3, %for.body93.for.body93_crit_edge ], [ %indvars.iv107.unr, %for.body93.preheader165 ]
  %w.379 = phi double [ %sub101.3, %for.body93.for.body93_crit_edge ], [ %w.379.unr, %for.body93.preheader165 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv107
  %44 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv107
  %45 = bitcast double* %arrayidx99 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %mul100 = fmul <2 x double> %46, %47
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next108.1
  %48 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next108.1
  %49 = bitcast double* %arrayidx99.2 to <2 x double>*
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %mul100.2 = fmul <2 x double> %50, %51
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next108.3 = add nsw i64 %indvars.iv107, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next108.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %n
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  br label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.body93.prol.loopexit.for.end104_crit_edge, %for.body88.for.end104_crit_edge, %for.end104.loopexit
  %w.3.lcssa = phi double [ %40, %for.body88.for.end104_crit_edge ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit.for.end104_crit_edge ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next110
  %52 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %52
  %sunkaddr161 = shl i64 %indvars.iv109, 3
  %sunkaddr162 = add i64 %sunkaddr, %sunkaddr161
  %sunkaddr163 = add i64 %sunkaddr162, -8
  %sunkaddr164 = inttoptr i64 %sunkaddr163 to double*
  store double %div109, double* %sunkaddr164, align 8
  %cmp87 = icmp sgt i64 %indvars.iv109, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next = add nsw i64 %indvars.iv168, -1
  %indvars.iv.next170 = add i2 %indvars.iv169, 1
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113.loopexit

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  br label %for.body88

for.end113.loopexit:                              ; preds = %for.end104
  br label %for.end113

for.end113:                                       ; preds = %for.cond86.preheader.for.end113_crit_edge, %for.cond61.preheader.for.end113_crit_edge, %entry.for.end113_crit_edge, %for.end113.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}

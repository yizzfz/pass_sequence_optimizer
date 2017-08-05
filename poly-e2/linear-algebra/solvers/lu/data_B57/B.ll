; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18, %for.cond1.preheader.lr.ph
  %indvars.iv122 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next123, %for.end18 ]
  %indvars.iv120 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next121, %for.end18 ]
  %0 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %.pre, %for.end18 ]
  %1 = sub i64 1999, %indvars.iv122
  %2 = sub i64 1998, %indvars.iv122
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %cmp968 = icmp slt i64 %indvars.iv.next123, 2000
  br i1 %cmp968, label %for.body11.lr.ph, label %for.end18

for.body11.lr.ph:                                 ; preds = %for.cond8.preheader
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body11.prol.loopexit, label %for.body11.prol.preheader

for.body11.prol.preheader:                        ; preds = %for.body11.lr.ph
  br label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.prol, %for.body11.prol.preheader
  %indvars.iv116.prol = phi i64 [ %indvars.iv120, %for.body11.prol.preheader ], [ %indvars.iv.next117.prol, %for.body11.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body11.prol.preheader ], [ %prol.iter.sub, %for.body11.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv116.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body11.prol.loopexit.loopexit, label %for.body11.prol, !llvm.loop !1

for.body11.prol.loopexit.loopexit:                ; preds = %for.body11.prol
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol.loopexit.loopexit, %for.body11.lr.ph
  %indvars.iv116.unr = phi i64 [ %indvars.iv120, %for.body11.lr.ph ], [ %indvars.iv.next117.prol, %for.body11.prol.loopexit.loopexit ]
  %3 = icmp ult i64 %2, 7
  br i1 %3, label %for.end18, label %for.body11.lr.ph.new

for.body11.lr.ph.new:                             ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv107 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next108, %for.body3 ]
  %4 = sub nsw i64 0, %indvars.iv107
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv107
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next108, %indvars.iv120
  br i1 %exitcond113, label %for.cond8.preheader, label %for.body3

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr, %for.body11.lr.ph.new ], [ %indvars.iv.next117.7, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next117.2 = add nsw i64 %indvars.iv116, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next117.3 = add nsw i64 %indvars.iv116, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next117.4 = add nsw i64 %indvars.iv116, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next117.5 = add nsw i64 %indvars.iv116, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next117.6 = add nsw i64 %indvars.iv116, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv.next117.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond130.7 = icmp eq i64 %indvars.iv.next117.6, 1999
  %indvars.iv.next117.7 = add nsw i64 %indvars.iv116, 8
  br i1 %exitcond130.7, label %for.end18.loopexit, label %for.body11

for.end18.loopexit:                               ; preds = %for.body11
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.body11.prol.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 2000
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond125, label %for.cond30.preheader.us.preheader, label %for.body3.lr.ph

for.cond30.preheader.us.preheader:                ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.cond30.preheader.us.preheader
  %indvars.iv103 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next104.7, %for.cond30.preheader.us ]
  %6 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %6
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104 = or i64 %indvars.iv103, 1
  %7 = mul nuw nsw i64 %indvars.iv.next104, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %7
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.1 = or i64 %indvars.iv103, 2
  %8 = mul nuw nsw i64 %indvars.iv.next104.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.2 = or i64 %indvars.iv103, 3
  %9 = mul nuw nsw i64 %indvars.iv.next104.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.3 = or i64 %indvars.iv103, 4
  %10 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.4 = or i64 %indvars.iv103, 5
  %11 = mul nuw nsw i64 %indvars.iv.next104.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.5 = or i64 %indvars.iv103, 6
  %12 = mul nuw nsw i64 %indvars.iv.next104.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.6 = or i64 %indvars.iv103, 7
  %13 = mul nuw nsw i64 %indvars.iv.next104.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond129.7 = icmp eq i64 %indvars.iv.next104.6, 1999
  %indvars.iv.next104.7 = add nsw i64 %indvars.iv103, 8
  br i1 %exitcond129.7, label %for.cond48.preheader.us.preheader, label %for.cond30.preheader.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.preheader.us
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond98 = icmp eq i64 %17, 2000
  br i1 %exitcond98, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.lr.ph.us

for.cond52.preheader.lr.ph.us:                    ; preds = %for.cond48.preheader.us.preheader, %for.inc75.us
  %indvars.iv95 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %17, %for.inc75.us ]
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 0, i64 %indvars.iv95
  %17 = add nuw nsw i64 %indvars.iv95, 1
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 1999, i64 %17
  %18 = bitcast double* %scevgep135 to i8*
  %19 = bitcast double* %scevgep133 to i8*
  br label %for.cond52.preheader.us.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.lr.ph.us
  %indvars.iv91 = phi i64 [ 0, %for.cond52.preheader.lr.ph.us ], [ %indvars.iv.next92, %for.cond52.for.inc72_crit_edge.us.us ]
  %20 = mul nuw nsw i64 %indvars.iv91, 16000
  %scevgep131 = getelementptr i8, i8* %call, i64 %20
  %21 = add nuw nsw i64 %20, 16000
  %scevgep132 = getelementptr i8, i8* %call, i64 %21
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv91, i64 %indvars.iv95
  %bound0 = icmp ult i8* %scevgep131, %18
  %bound1 = icmp ult i8* %19, %scevgep132
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0138 = icmp ult i8* %scevgep131, %bc
  %bound1139 = icmp ult i8* %bc, %scevgep132
  %found.conflict140 = and i1 %bound0138, %bound1139
  %conflict.rdx = or i1 %found.conflict, %found.conflict140
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %for.cond52.preheader.us.us
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %index, i64 %indvars.iv95
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %22, i64 %indvars.iv95
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %23, i64 %indvars.iv95
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %24, i64 %indvars.iv95
  %32 = load double, double* %28, align 8, !alias.scope !6
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = fmul <2 x double> %27, %37
  %41 = fmul <2 x double> %27, %39
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv91, i64 %index
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %46 = fadd <2 x double> %wide.load, %40
  %47 = fadd <2 x double> %wide.load142, %41
  store <2 x double> %46, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %47, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %48 = icmp eq i64 %index.next, 2000
  br i1 %48, label %for.cond52.for.inc72_crit_edge.us.us.loopexit175, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit175: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit175, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond94, label %for.inc75.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv87 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next88.1, %for.body55.us.us ]
  %49 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv87, i64 %indvars.iv95
  %50 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %49, %50
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv91, i64 %indvars.iv87
  %51 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %51, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next88 = or i64 %indvars.iv87, 1
  %52 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next88, i64 %indvars.iv95
  %53 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %52, %53
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next88
  %54 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %54, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next88, 1999
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us, !llvm.loop !14

for.cond82.preheader.us.preheader:                ; preds = %for.inc75.us
  %55 = bitcast i8* %call to [2000 x [2000 x double]]*
  %56 = bitcast i8* %call to [2000 x [2000 x double]]*
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv83 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %58, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 0
  %58 = add nuw nsw i64 %indvars.iv83, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 %58, i64 0
  %scevgep152 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv83, i64 0
  %scevgep154 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %58, i64 0
  %bound0156 = icmp ult double* %scevgep148, %scevgep154
  %bound1157 = icmp ult double* %scevgep152, %scevgep150
  %memcheck.conflict159 = and i1 %bound0156, %bound1157
  br i1 %memcheck.conflict159, label %for.body85.us.preheader, label %vector.body143.preheader

vector.body143.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body143

for.body85.us.preheader:                          ; preds = %for.cond82.preheader.us
  br label %for.body85.us

vector.body143:                                   ; preds = %vector.body143, %vector.body143.preheader
  %index162 = phi i64 [ 0, %vector.body143.preheader ], [ %index.next163.1, %vector.body143 ]
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv83, i64 %index162
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load170 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load171 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !15
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %index162
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load170, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load171, <2 x i64>* %66, align 8, !alias.scope !18, !noalias !15
  %index.next163 = or i64 %index162, 4
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv83, i64 %index.next163
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load170.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !15
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load171.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !15
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %index.next163
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load170.1, <2 x i64>* %72, align 8, !alias.scope !18, !noalias !15
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load171.1, <2 x i64>* %74, align 8, !alias.scope !18, !noalias !15
  %index.next163.1 = add nsw i64 %index162, 8
  %75 = icmp eq i64 %index.next163.1, 2000
  br i1 %75, label %for.cond82.for.inc97_crit_edge.us.loopexit174, label %vector.body143, !llvm.loop !20

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv83, i64 %indvars.iv
  %76 = bitcast double* %arrayidx89.us to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %indvars.iv
  %78 = bitcast double* %arrayidx93.us to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next
  %79 = bitcast double* %arrayidx89.us.1 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.1
  %82 = bitcast double* %arrayidx89.us.2 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.2
  %85 = bitcast double* %arrayidx89.us.3 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.3
  %88 = bitcast double* %arrayidx89.us.4 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv83, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %89, i64* %90, align 8
  %exitcond128.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond128.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit174:    ; preds = %vector.body143
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit174, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond86 = icmp eq i64 %58, 2000
  br i1 %exitcond86, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.lr.ph
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next53, %for.inc54 ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.end
  %xtraiter56 = and i64 %indvars.iv52, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  %0 = icmp eq i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv52, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod57, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %1 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr58.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre30, %for.cond31.preheader.us ]
  br i1 %0, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.cond31.preheader.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next42.1, %for.body33.us ]
  %3 = phi double [ %.unr58.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %4 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %5 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %4, %5
  %sub47.us = fsub double %3, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %6 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %7 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %6, %7
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond51, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.body6.preheader, label %for.end

for.body6.preheader:                              ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.preheader
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.preheader ]
  %10 = icmp eq i64 %indvars.iv34, 1
  br i1 %10, label %for.end, label %for.body6.preheader.new

for.body6.preheader.new:                          ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.preheader.new ], [ %indvars.iv.next.1, %for.body6 ]
  %11 = phi double [ %.unr.ph, %for.body6.preheader.new ], [ %sub.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit, %for.cond4.preheader
  %16 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond55, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond14, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}

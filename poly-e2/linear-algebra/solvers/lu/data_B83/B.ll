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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv116 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next117, %for.inc23 ]
  %indvars.iv114 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next115, %for.inc23 ]
  %0 = sub i64 1999, %indvars.iv116
  %1 = sub i64 1998, %indvars.iv116
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %cmp970 = icmp slt i64 %indvars.iv.next117, 2000
  br i1 %cmp970, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %xtraiter = and i64 %0, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv111.prol = phi i64 [ %indvars.iv114, %for.inc16.prol.preheader ], [ %indvars.iv.next112.prol, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv111.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next112.prol = add nuw nsw i64 %indvars.iv111.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv111.unr = phi i64 [ %indvars.iv114, %for.inc16.lr.ph ], [ %indvars.iv.next112.prol, %for.inc16.prol.loopexit.loopexit ]
  %2 = icmp ult i64 %1, 7
  br i1 %2, label %for.inc23, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv103 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next104, %for.inc ]
  %3 = sub nsw i64 0, %indvars.iv103
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv103
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next104, %indvars.iv114
  br i1 %exitcond108, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv111 = phi i64 [ %indvars.iv111.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next112.7, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv111
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next112.2 = add nsw i64 %indvars.iv111, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next112.3 = add nsw i64 %indvars.iv111, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next112.4 = add nsw i64 %indvars.iv111, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next112.5 = add nsw i64 %indvars.iv111, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next112.6 = add nsw i64 %indvars.iv111, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next112.7 = add nsw i64 %indvars.iv111, 8
  %exitcond113.7 = icmp eq i64 %indvars.iv.next112.7, 2000
  br i1 %exitcond113.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv116
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond118 = icmp eq i64 %indvars.iv.next117, 2000
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br i1 %exitcond118, label %for.cond48.preheader.us.preheader, label %for.inc.lr.ph

for.cond48.preheader.us.preheader:                ; preds = %for.inc23
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv94 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %5, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep120 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv94
  %5 = add nuw nsw i64 %indvars.iv94, 1
  %scevgep122 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %5
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond96 = icmp eq i64 %5, 2000
  br i1 %exitcond96, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next92, %for.cond52.for.inc72_crit_edge.us.us ]
  %6 = bitcast double* %scevgep122 to i8*
  %7 = bitcast double* %scevgep120 to i8*
  %8 = mul nuw nsw i64 %indvars.iv91, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %8
  %9 = add nuw nsw i64 %8, 16000
  %scevgep119 = getelementptr i8, i8* %call, i64 %9
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv94
  %bound0 = icmp ult i8* %scevgep, %6
  %bound1 = icmp ult i8* %7, %scevgep119
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0125 = icmp ult i8* %scevgep, %bc
  %bound1126 = icmp ult i8* %bc, %scevgep119
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx = or i1 %found.conflict, %found.conflict127
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  %11 = or i64 %index, 1
  %12 = or i64 %index, 2
  %13 = or i64 %index, 3
  %14 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %15 = insertelement <2 x double> undef, double %14, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv94
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %11, i64 %indvars.iv94
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %12, i64 %indvars.iv94
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %13, i64 %indvars.iv94
  %21 = load double, double* %17, align 8, !alias.scope !6
  %22 = load double, double* %18, align 8, !alias.scope !6
  %23 = load double, double* %19, align 8, !alias.scope !6
  %24 = load double, double* %20, align 8, !alias.scope !6
  %25 = insertelement <2 x double> undef, double %21, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = fmul <2 x double> %16, %26
  %30 = fmul <2 x double> %16, %28
  %31 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv91, i64 %index
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !8, !noalias !10
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !8, !noalias !10
  %35 = fadd <2 x double> %29, %wide.load
  %36 = fadd <2 x double> %30, %wide.load129
  store <2 x double> %35, <2 x double>* %32, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %36, <2 x double>* %34, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %37 = icmp eq i64 %index.next, 2000
  br i1 %37, label %for.cond52.for.inc72_crit_edge.us.us.loopexit162, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit162: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit162, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond93, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv88 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next89.1, %for.inc69.us.us ]
  %38 = bitcast i8* %call to [2000 x [2000 x double]]*
  %39 = bitcast i8* %call to [2000 x [2000 x double]]*
  %40 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv94
  %41 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %40, %41
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv91, i64 %indvars.iv88
  %42 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %42
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next89 = or i64 %indvars.iv88, 1
  %43 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next89, i64 %indvars.iv94
  %44 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %43, %44
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next89
  %45 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %45
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next89.1, 2000
  br i1 %exitcond90.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv85 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %47, %for.cond82.for.inc97_crit_edge.us ]
  %46 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 0
  %47 = add nuw nsw i64 %indvars.iv85, 1
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %A, i64 %47, i64 0
  %scevgep139 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv85, i64 0
  %scevgep141 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %47, i64 0
  %bound0143 = icmp ult double* %scevgep135, %scevgep141
  %bound1144 = icmp ult double* %scevgep139, %scevgep137
  %memcheck.conflict146 = and i1 %bound0143, %bound1144
  br i1 %memcheck.conflict146, label %for.inc94.us.preheader, label %vector.body130.preheader

vector.body130.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body130

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body130:                                   ; preds = %vector.body130, %vector.body130.preheader
  %index149 = phi i64 [ 0, %vector.body130.preheader ], [ %index.next150.1, %vector.body130 ]
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv85, i64 %index149
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load157 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !15
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load158 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !15
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %index149
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load157, <2 x i64>* %54, align 8, !alias.scope !18, !noalias !15
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load158, <2 x i64>* %56, align 8, !alias.scope !18, !noalias !15
  %index.next150 = or i64 %index149, 4
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv85, i64 %index.next150
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load157.1 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !15
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load158.1 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %index.next150
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load157.1, <2 x i64>* %62, align 8, !alias.scope !18, !noalias !15
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load158.1, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %index.next150.1 = add nsw i64 %index149, 8
  %65 = icmp eq i64 %index.next150.1, 2000
  br i1 %65, label %for.cond82.for.inc97_crit_edge.us.loopexit161, label %vector.body130, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %66 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv85, i64 %indvars.iv
  %67 = bitcast double* %arrayidx89.us to i64*
  %68 = load i64, i64* %67, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv
  %69 = bitcast double* %arrayidx93.us to i64*
  store i64 %68, i64* %69, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next
  %70 = bitcast double* %arrayidx89.us.1 to i64*
  %71 = load i64, i64* %70, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next
  %72 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %73 = bitcast double* %arrayidx89.us.2 to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %75 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %76 = bitcast double* %arrayidx89.us.3 to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %78 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.3
  %79 = bitcast double* %arrayidx89.us.4 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next.3
  %81 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit161:    ; preds = %vector.body130
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit161, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond87 = icmp eq i64 %47, 2000
  br i1 %exitcond87, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc54
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc54 ], [ 0, %entry ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.inc25
  %xtraiter58 = and i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv52, %for.cond31.preheader.us.preheader ]
  %0 = icmp eq i64 %xtraiter58, 0
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %0, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %1 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.cond31.preheader.us
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr60.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre30, %for.cond31.preheader.us ]
  %3 = icmp eq i64 %indvars.iv52, 1
  br i1 %3, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next42.1, %for.inc48.us ]
  %4 = phi double [ %.unr60.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond56, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  %11 = icmp eq i64 %indvars.iv34, 1
  br i1 %11, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %12 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond57, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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

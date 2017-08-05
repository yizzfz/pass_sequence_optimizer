; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay22 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %arraydecay1, [120 x [120 x double]]* %arraydecay22)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay33 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay44 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay33, [120 x [120 x double]]* %arraydecay44)
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
  %arraydecay66 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %arraydecay66)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next27, %for.inc22 ]
  %0 = trunc i64 %indvars.iv26 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next24, %for.inc19 ]
  %1 = trunc i64 %indvars.iv23 to i32
  %add = add i32 %sub, %1
  br label %for.inc

for.inc:                                          ; preds = %for.cond4.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.cond4.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %add, %3
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv26, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next27, 120
  br i1 %exitcond29, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.013 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc98
  %indvar61 = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next62, %for.inc98 ]
  %indvars.iv20 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next21, %for.inc98 ]
  %0 = add nuw nsw i64 %indvar61, 1
  %1 = add nuw nsw i64 %indvar61, 2
  %add = add nuw nsw i64 %indvars.iv20, 1
  %sub23 = add nsw i64 %indvars.iv20, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond4.preheader, %for.inc95.us
  %indvar63 = phi i64 [ 0, %for.cond4.preheader ], [ %indvar.next64, %for.inc95.us ]
  %indvars.iv16 = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next17, %for.inc95.us ]
  %2 = add nuw nsw i64 %indvar63, 1
  %scevgep65 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %2, i64 1
  %scevgep67 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %2, i64 119
  %scevgep69 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar61, i64 %2, i64 1
  %scevgep71 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %2, i64 119
  %add34.us = add nuw nsw i64 %indvars.iv16, 1
  %sub49.us = add nsw i64 %indvars.iv16, -1
  %bound073 = icmp ult double* %scevgep65, %scevgep71
  %bound174 = icmp ult double* %scevgep69, %scevgep67
  %memcheck.conflict76 = and i1 %bound073, %bound174
  br i1 %memcheck.conflict76, label %for.inc.us.preheader, label %vector.body56.preheader

vector.body56.preheader:                          ; preds = %for.cond8.preheader.us
  br label %vector.body56

for.inc.us.preheader:                             ; preds = %for.cond8.preheader.us
  br label %for.inc.us

vector.body56:                                    ; preds = %vector.body56.preheader, %vector.body56
  %index79 = phi i64 [ %index.next80, %vector.body56 ], [ 0, %vector.body56.preheader ]
  %offset.idx83 = or i64 %index79, 1
  %3 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv16, i64 %offset.idx83
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %offset.idx83
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = fmul <2 x double> %wide.load88, <double 2.000000e+00, double 2.000000e+00>
  %8 = fsub <2 x double> %wide.load87, %7
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv16, i64 %offset.idx83
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = fadd <2 x double> %wide.load89, %8
  %12 = fmul <2 x double> %11, <double 1.250000e-01, double 1.250000e-01>
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %add34.us, i64 %offset.idx83
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = bitcast double* %5 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fmul <2 x double> %wide.load91, <double 2.000000e+00, double 2.000000e+00>
  %17 = fsub <2 x double> %wide.load90, %16
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %sub49.us, i64 %offset.idx83
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %wide.load92, %17
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %12, %21
  %23 = add nuw nsw i64 %offset.idx83, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = bitcast double* %5 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fmul <2 x double> %wide.load94, <double 2.000000e+00, double 2.000000e+00>
  %28 = fsub <2 x double> %wide.load93, %27
  %29 = add nsw i64 %offset.idx83, -1
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %wide.load95, %28
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = fadd <2 x double> %22, %33
  %35 = bitcast double* %5 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %wide.load96, %34
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %offset.idx83
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next80 = add nuw nsw i64 %index79, 2
  %39 = icmp eq i64 %index.next80, 118
  br i1 %39, label %for.inc95.us.loopexit2, label %vector.body56, !llvm.loop !6

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 1, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv16, i64 %indvars.iv
  %40 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  %41 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %41, 2.000000e+00
  %sub22.us = fsub double %40, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv16, i64 %indvars.iv
  %42 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %42, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %add34.us, i64 %indvars.iv
  %43 = load double, double* %arrayidx38.us, align 8
  %arrayidx44.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  %44 = load double, double* %arrayidx44.us, align 8
  %mul45.us = fmul double %44, 2.000000e+00
  %sub46.us = fsub double %43, %mul45.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %sub49.us, i64 %indvars.iv
  %45 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %45, %sub46.us
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %add61.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %add61.us
  %46 = load double, double* %arrayidx63.us, align 8
  %arrayidx69.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  %47 = load double, double* %arrayidx69.us, align 8
  %mul70.us = fmul double %47, 2.000000e+00
  %sub71.us = fsub double %46, %mul70.us
  %sub76.us = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %sub76.us
  %48 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %48, %sub71.us
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %arrayidx87.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  %49 = load double, double* %arrayidx87.us, align 8
  %add88.us = fadd double %49, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.us.loopexit, label %for.inc.us, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us.loopexit2:                           ; preds = %vector.body56
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit2, %for.inc95.us.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 119
  %indvar.next64 = add nuw nsw i64 %indvar63, 1
  br i1 %exitcond19, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 119
  %indvar.next62 = add nuw nsw i64 %indvar61, 1
  br i1 %exitcond23, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %50 = add nuw nsw i64 %indvar, 1
  %51 = add nuw nsw i64 %indvar, 2
  %add113 = add nuw nsw i64 %indvars.iv33, 1
  %sub128 = add nsw i64 %indvars.iv33, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond105.preheader, %for.inc203.us
  %indvar38 = phi i64 [ 0, %for.cond105.preheader ], [ %indvar.next39, %for.inc203.us ]
  %indvars.iv29 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next30, %for.inc203.us ]
  %52 = add nuw nsw i64 %indvar38, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %50, i64 %52, i64 1
  %scevgep41 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %50, i64 %52, i64 119
  %scevgep43 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %52, i64 1
  %scevgep45 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %51, i64 %52, i64 119
  %add139.us = add nuw nsw i64 %indvars.iv29, 1
  %sub154.us = add nsw i64 %indvars.iv29, -1
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader.us
  br label %vector.body

for.inc200.us.preheader:                          ; preds = %for.cond109.preheader.us
  br label %for.inc200.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv29, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fmul <2 x double> %wide.load47, <double 2.000000e+00, double 2.000000e+00>
  %58 = fsub <2 x double> %wide.load, %57
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv29, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fadd <2 x double> %wide.load48, %58
  %62 = fmul <2 x double> %61, <double 1.250000e-01, double 1.250000e-01>
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %add139.us, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = bitcast double* %55 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fmul <2 x double> %wide.load50, <double 2.000000e+00, double 2.000000e+00>
  %67 = fsub <2 x double> %wide.load49, %66
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %sub154.us, i64 %offset.idx
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fadd <2 x double> %wide.load51, %67
  %71 = fmul <2 x double> %70, <double 1.250000e-01, double 1.250000e-01>
  %72 = fadd <2 x double> %62, %71
  %73 = add nuw nsw i64 %offset.idx, 1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = bitcast double* %55 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %78 = fsub <2 x double> %wide.load52, %77
  %79 = add nsw i64 %offset.idx, -1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %79
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fadd <2 x double> %wide.load54, %78
  %83 = fmul <2 x double> %82, <double 1.250000e-01, double 1.250000e-01>
  %84 = fadd <2 x double> %72, %83
  %85 = bitcast double* %55 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %wide.load55, %84
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv33, i64 %indvars.iv29, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  store <2 x double> %86, <2 x double>* %88, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %89 = icmp eq i64 %index.next, 118
  br i1 %89, label %for.inc203.us.loopexit1, label %vector.body, !llvm.loop !15

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.inc200.us ], [ 1, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv29, i64 %indvars.iv25
  %90 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  %91 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %91, 2.000000e+00
  %sub127.us = fsub double %90, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv29, i64 %indvars.iv25
  %92 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %92, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %add139.us, i64 %indvars.iv25
  %93 = load double, double* %arrayidx143.us, align 8
  %arrayidx149.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  %94 = load double, double* %arrayidx149.us, align 8
  %mul150.us = fmul double %94, 2.000000e+00
  %sub151.us = fsub double %93, %mul150.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %sub154.us, i64 %indvars.iv25
  %95 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %95, %sub151.us
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %add166.us = add nuw nsw i64 %indvars.iv25, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %add166.us
  %96 = load double, double* %arrayidx168.us, align 8
  %arrayidx174.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  %97 = load double, double* %arrayidx174.us, align 8
  %mul175.us = fmul double %97, 2.000000e+00
  %sub176.us = fsub double %96, %mul175.us
  %sub181.us = add nsw i64 %indvars.iv25, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %sub181.us
  %98 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %98, %sub176.us
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %arrayidx192.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  %99 = load double, double* %arrayidx192.us, align 8
  %add193.us = fadd double %99, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv33, i64 %indvars.iv29, i64 %indvars.iv25
  store double %add193.us, double* %arrayidx199.us, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 119
  br i1 %exitcond28, label %for.inc203.us.loopexit, label %for.inc200.us, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us.loopexit1:                          ; preds = %vector.body
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit1, %for.inc203.us.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 119
  %indvar.next39 = add nuw nsw i64 %indvar38, 1
  br i1 %exitcond32, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.inc203.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond36, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.013, 1
  %exitcond37 = icmp eq i32 %inc210, 501
  br i1 %exitcond37, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv27, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next24, %for.inc18 ]
  %mul815 = add nuw nsw i64 %indvars.iv23, %3
  %add = mul nuw nsw i64 %mul815, 120
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond26, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next28, 120
  br i1 %exitcond31, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}

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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay1, [120 x [120 x double]]* %arraydecay22)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay1, [120 x [120 x double]]* %arraydecay22)
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
  %1 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.inc22 ]
  %0 = trunc i64 %indvars.iv27 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv24 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next25, %for.inc19 ]
  %1 = trunc i64 %indvars.iv24 to i32
  %add = add i32 %sub, %1
  br label %for.inc

for.inc:                                          ; preds = %for.cond4.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.cond4.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv27, i64 %indvars.iv24, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv24, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %add, %3
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv27, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv27, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond31, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 120
  br i1 %exitcond30, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.0114 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond8.preheader.us.preheader

for.cond8.preheader.us.preheader:                 ; preds = %for.cond1.preheader, %for.inc98
  %indvar160 = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next161, %for.inc98 ]
  %indvars.iv121 = phi i64 [ 1, %for.cond1.preheader ], [ %add, %for.inc98 ]
  %0 = add nuw nsw i64 %indvar160, 1
  %1 = add nuw nsw i64 %indvar160, 2
  %add = add nuw nsw i64 %indvars.iv121, 1
  %sub23 = add nsw i64 %indvars.iv121, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.inc95.us, %for.cond8.preheader.us.preheader
  %indvar162 = phi i64 [ %indvar.next163, %for.inc95.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %indvars.iv117 = phi i64 [ %add34.us, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %2 = add nuw nsw i64 %indvar162, 1
  %scevgep164 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %2, i64 1
  %scevgep166 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %2, i64 119
  %scevgep168 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar160, i64 %2, i64 1
  %scevgep170 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %2, i64 119
  %add34.us = add nuw nsw i64 %indvars.iv117, 1
  %sub49.us = add nsw i64 %indvars.iv117, -1
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  br i1 %memcheck.conflict175, label %for.inc.us.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %for.cond8.preheader.us
  br label %vector.body155

for.inc.us.preheader:                             ; preds = %for.cond8.preheader.us
  br label %for.inc.us

vector.body155:                                   ; preds = %vector.body155.preheader, %vector.body155
  %index178 = phi i64 [ %index.next179, %vector.body155 ], [ 0, %vector.body155.preheader ]
  %offset.idx182 = or i64 %index178, 1
  %3 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv117, i64 %offset.idx182
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv117, i64 %offset.idx182
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = fmul <2 x double> %wide.load187, <double 2.000000e+00, double 2.000000e+00>
  %8 = fsub <2 x double> %wide.load186, %7
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv117, i64 %offset.idx182
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load188 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = fadd <2 x double> %wide.load188, %8
  %12 = fmul <2 x double> %11, <double 1.250000e-01, double 1.250000e-01>
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %add34.us, i64 %offset.idx182
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fsub <2 x double> %wide.load189, %7
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %sub49.us, i64 %offset.idx182
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load190, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = fadd <2 x double> %12, %19
  %21 = add nuw nsw i64 %offset.idx182, 1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv117, i64 %21
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fsub <2 x double> %wide.load191, %7
  %25 = add nsw i64 %offset.idx182, -1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv117, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load192 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load192, %24
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = fadd <2 x double> %20, %29
  %31 = fadd <2 x double> %wide.load187, %30
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121, i64 %indvars.iv117, i64 %offset.idx182
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next179 = add nuw nsw i64 %index178, 2
  %34 = icmp eq i64 %index.next179, 118
  br i1 %34, label %for.inc95.us.loopexit194, label %vector.body155, !llvm.loop !6

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %add61.us, %for.inc.us ], [ 1, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv117, i64 %indvars.iv
  %35 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv117, i64 %indvars.iv
  %36 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %36, 2.000000e+00
  %sub22.us = fsub double %35, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv117, i64 %indvars.iv
  %37 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %37, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %add34.us, i64 %indvars.iv
  %38 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %38, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %sub49.us, i64 %indvars.iv
  %39 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %39, %sub46.us
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %add61.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv117, i64 %add61.us
  %40 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %40, %mul.us
  %sub76.us = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121, i64 %indvars.iv117, i64 %sub76.us
  %41 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %41, %sub71.us
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %36, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121, i64 %indvars.iv117, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %add61.us, 119
  br i1 %exitcond, label %for.inc95.us.loopexit, label %for.inc.us, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us.loopexit194:                         ; preds = %vector.body155
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit194, %for.inc95.us.loopexit
  %exitcond120 = icmp eq i64 %add34.us, 119
  %indvar.next163 = add nuw nsw i64 %indvar162, 1
  br i1 %exitcond120, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us
  %exitcond124 = icmp eq i64 %add, 119
  %indvar.next161 = add nuw nsw i64 %indvar160, 1
  br i1 %exitcond124, label %for.cond109.preheader.us.preheader.preheader, label %for.cond8.preheader.us.preheader

for.cond109.preheader.us.preheader.preheader:     ; preds = %for.inc98
  br label %for.cond109.preheader.us.preheader

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.us.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond109.preheader.us.preheader.preheader ]
  %indvars.iv134 = phi i64 [ %add113, %for.inc206 ], [ 1, %for.cond109.preheader.us.preheader.preheader ]
  %42 = add nuw nsw i64 %indvar, 1
  %43 = add nuw nsw i64 %indvar, 2
  %add113 = add nuw nsw i64 %indvars.iv134, 1
  %sub128 = add nsw i64 %indvars.iv134, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.inc203.us, %for.cond109.preheader.us.preheader
  %indvar140 = phi i64 [ %indvar.next141, %for.inc203.us ], [ 0, %for.cond109.preheader.us.preheader ]
  %indvars.iv130 = phi i64 [ %add139.us, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %44 = add nuw nsw i64 %indvar140, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %42, i64 %44, i64 1
  %scevgep143 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %42, i64 %44, i64 119
  %scevgep145 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %44, i64 1
  %scevgep147 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %43, i64 %44, i64 119
  %add139.us = add nuw nsw i64 %indvars.iv130, 1
  %sub154.us = add nsw i64 %indvars.iv130, -1
  %bound0 = icmp ult double* %scevgep, %scevgep147
  %bound1 = icmp ult double* %scevgep145, %scevgep143
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader.us
  br label %vector.body

for.inc200.us.preheader:                          ; preds = %for.cond109.preheader.us
  br label %for.inc200.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv130, i64 %offset.idx
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !10
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %indvars.iv130, i64 %offset.idx
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !10
  %49 = fmul <2 x double> %wide.load149, <double 2.000000e+00, double 2.000000e+00>
  %50 = fsub <2 x double> %wide.load, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv130, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = fadd <2 x double> %wide.load150, %50
  %54 = fmul <2 x double> %53, <double 1.250000e-01, double 1.250000e-01>
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %add139.us, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fsub <2 x double> %wide.load151, %49
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %sub154.us, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fadd <2 x double> %wide.load152, %57
  %61 = fmul <2 x double> %60, <double 1.250000e-01, double 1.250000e-01>
  %62 = fadd <2 x double> %54, %61
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %indvars.iv130, i64 %63
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fsub <2 x double> %wide.load153, %49
  %67 = add nsw i64 %offset.idx, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %indvars.iv130, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fadd <2 x double> %wide.load154, %66
  %71 = fmul <2 x double> %70, <double 1.250000e-01, double 1.250000e-01>
  %72 = fadd <2 x double> %62, %71
  %73 = fadd <2 x double> %wide.load149, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv134, i64 %indvars.iv130, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %76 = icmp eq i64 %index.next, 118
  br i1 %76, label %for.inc203.us.loopexit193, label %vector.body, !llvm.loop !15

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv126 = phi i64 [ %add166.us, %for.inc200.us ], [ 1, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv130, i64 %indvars.iv126
  %77 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %indvars.iv130, i64 %indvars.iv126
  %78 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %78, 2.000000e+00
  %sub127.us = fsub double %77, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv130, i64 %indvars.iv126
  %79 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %79, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %add139.us, i64 %indvars.iv126
  %80 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %80, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %sub154.us, i64 %indvars.iv126
  %81 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %81, %sub151.us
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %add166.us = add nuw nsw i64 %indvars.iv126, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %indvars.iv130, i64 %add166.us
  %82 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %82, %mul126.us
  %sub181.us = add nsw i64 %indvars.iv126, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv134, i64 %indvars.iv130, i64 %sub181.us
  %83 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %83, %sub176.us
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %78, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv134, i64 %indvars.iv130, i64 %indvars.iv126
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond129 = icmp eq i64 %add166.us, 119
  br i1 %exitcond129, label %for.inc203.us.loopexit, label %for.inc200.us, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us.loopexit193:                        ; preds = %vector.body
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit193, %for.inc203.us.loopexit
  %exitcond133 = icmp eq i64 %add139.us, 119
  %indvar.next141 = add nuw nsw i64 %indvar140, 1
  br i1 %exitcond133, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.inc203.us
  %exitcond137 = icmp eq i64 %add113, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond137, label %for.inc209, label %for.cond109.preheader.us.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.0114, 1
  %exitcond138 = icmp eq i32 %inc210, 501
  br i1 %exitcond138, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv29 = phi i64 [ 0, %entry ], [ %indvars.iv.next30, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv29, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next26, %for.inc18 ]
  %mul815 = add nuw nsw i64 %indvars.iv25, %3
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
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv29, i64 %indvars.iv25, i64 %indvars.iv
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 120
  br i1 %exitcond28, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next30, 120
  br i1 %exitcond34, label %for.end23, label %for.cond2.preheader

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

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
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
  %arraydecay6 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay6)
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
  %indvars.iv25 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.inc22 ]
  %0 = add nuw nsw i64 %indvars.iv25, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next22, %for.inc19 ]
  %1 = add nuw nsw i64 %0, %indvars.iv21
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.body6 ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.body6

for.inc19:                                        ; preds = %for.body6
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond24, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 120
  br i1 %exitcond28, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.lr.ph

for.cond4.preheader.lr.ph:                        ; preds = %for.inc209, %entry
  %t.0114 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond8.preheader.lr.ph

for.cond8.preheader.lr.ph:                        ; preds = %for.inc98, %for.cond4.preheader.lr.ph
  %indvar160 = phi i64 [ %indvar.next161, %for.inc98 ], [ 0, %for.cond4.preheader.lr.ph ]
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc98 ], [ 1, %for.cond4.preheader.lr.ph ]
  %0 = add nuw nsw i64 %indvar160, 1
  %1 = add nuw nsw i64 %indvar160, 2
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %2 = add nsw i64 %indvars.iv120, -1
  br label %for.body11.lr.ph

for.body11.lr.ph:                                 ; preds = %for.inc95, %for.cond8.preheader.lr.ph
  %indvar162 = phi i64 [ %indvar.next163, %for.inc95 ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.inc95 ], [ 1, %for.cond8.preheader.lr.ph ]
  %3 = add nuw nsw i64 %indvar162, 1
  %scevgep164 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 1
  %scevgep166 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 119
  %scevgep168 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar160, i64 %3, i64 1
  %scevgep170 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %3, i64 119
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %4 = add nsw i64 %indvars.iv116, -1
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  br i1 %memcheck.conflict175, label %for.body11.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %for.body11.lr.ph
  br label %vector.body155

for.body11.preheader:                             ; preds = %for.body11.lr.ph
  br label %for.body11

vector.body155:                                   ; preds = %vector.body155.preheader, %vector.body155
  %index178 = phi i64 [ %index.next179, %vector.body155 ], [ 0, %vector.body155.preheader ]
  %offset.idx182 = or i64 %index178, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next121, i64 %indvars.iv116, i64 %offset.idx182
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %offset.idx182
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load187, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load186, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv116, i64 %offset.idx182
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load188 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load188, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv.next117, i64 %offset.idx182
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = bitcast double* %7 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fmul <2 x double> %wide.load190, <double 2.000000e+00, double 2.000000e+00>
  %19 = fsub <2 x double> %wide.load189, %18
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %4, i64 %offset.idx182
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load191, %19
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = fadd <2 x double> %14, %23
  %25 = add nuw nsw i64 %offset.idx182, 1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load192 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = bitcast double* %7 to <2 x double>*
  %wide.load193 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fmul <2 x double> %wide.load193, <double 2.000000e+00, double 2.000000e+00>
  %30 = fsub <2 x double> %wide.load192, %29
  %31 = add nsw i64 %offset.idx182, -1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load194 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %wide.load194, %30
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %24, %35
  %37 = bitcast double* %7 to <2 x double>*
  %wide.load195 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = fadd <2 x double> %wide.load195, %36
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv120, i64 %indvars.iv116, i64 %offset.idx182
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next179 = add nuw nsw i64 %index178, 2
  %41 = icmp eq i64 %index.next179, 118
  br i1 %41, label %for.inc95.loopexit197, label %vector.body155, !llvm.loop !6

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11 ], [ 1, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next121, i64 %indvars.iv116, i64 %indvars.iv
  %42 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %indvars.iv
  %43 = load double, double* %arrayidx21, align 8
  %mul = fmul double %43, 2.000000e+00
  %sub22 = fsub double %42, %mul
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv116, i64 %indvars.iv
  %44 = load double, double* %arrayidx29, align 8
  %add30 = fadd double %44, %sub22
  %mul31 = fmul double %add30, 1.250000e-01
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv.next117, i64 %indvars.iv
  %45 = load double, double* %arrayidx38, align 8
  %arrayidx44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %indvars.iv
  %46 = load double, double* %arrayidx44, align 8
  %mul45 = fmul double %46, 2.000000e+00
  %sub46 = fsub double %45, %mul45
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %4, i64 %indvars.iv
  %47 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %47, %sub46
  %mul55 = fmul double %add54, 1.250000e-01
  %add56 = fadd double %mul31, %mul55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %indvars.iv.next
  %48 = load double, double* %arrayidx63, align 8
  %arrayidx69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %indvars.iv
  %49 = load double, double* %arrayidx69, align 8
  %mul70 = fmul double %49, 2.000000e+00
  %sub71 = fsub double %48, %mul70
  %50 = add nsw i64 %indvars.iv, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %50
  %51 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %51, %sub71
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %arrayidx87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv116, i64 %indvars.iv
  %52 = load double, double* %arrayidx87, align 8
  %add88 = fadd double %52, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv120, i64 %indvars.iv116, i64 %indvars.iv
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.loopexit, label %for.body11, !llvm.loop !9

for.inc95.loopexit:                               ; preds = %for.body11
  br label %for.inc95

for.inc95.loopexit197:                            ; preds = %vector.body155
  br label %for.inc95

for.inc95:                                        ; preds = %for.inc95.loopexit197, %for.inc95.loopexit
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 119
  %indvar.next163 = add nuw nsw i64 %indvar162, 1
  br i1 %exitcond119, label %for.inc98, label %for.body11.lr.ph

for.inc98:                                        ; preds = %for.inc95
  %exitcond123 = icmp eq i64 %indvars.iv.next121, 119
  %indvar.next161 = add nuw nsw i64 %indvar160, 1
  br i1 %exitcond123, label %for.cond109.preheader.lr.ph.preheader, label %for.cond8.preheader.lr.ph

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.inc98
  br label %for.cond109.preheader.lr.ph

for.cond109.preheader.lr.ph:                      ; preds = %for.cond109.preheader.lr.ph.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond109.preheader.lr.ph.preheader ]
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.inc206 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %53 = add nuw nsw i64 %indvar, 1
  %54 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %55 = add nsw i64 %indvars.iv132, -1
  br label %for.body112.lr.ph

for.body112.lr.ph:                                ; preds = %for.inc203, %for.cond109.preheader.lr.ph
  %indvar137 = phi i64 [ %indvar.next138, %for.inc203 ], [ 0, %for.cond109.preheader.lr.ph ]
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %for.inc203 ], [ 1, %for.cond109.preheader.lr.ph ]
  %56 = add nuw nsw i64 %indvar137, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %53, i64 %56, i64 1
  %scevgep140 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %53, i64 %56, i64 119
  %scevgep142 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %56, i64 1
  %scevgep144 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %54, i64 %56, i64 119
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %57 = add nsw i64 %indvars.iv128, -1
  %bound0 = icmp ult double* %scevgep, %scevgep144
  %bound1 = icmp ult double* %scevgep142, %scevgep140
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body112.lr.ph
  br label %vector.body

for.body112.preheader:                            ; preds = %for.body112.lr.ph
  br label %for.body112

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next133, i64 %indvars.iv128, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fmul <2 x double> %wide.load146, <double 2.000000e+00, double 2.000000e+00>
  %63 = fsub <2 x double> %wide.load, %62
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %55, i64 %indvars.iv128, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %wide.load147, %63
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv.next129, i64 %offset.idx
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = bitcast double* %60 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fmul <2 x double> %wide.load149, <double 2.000000e+00, double 2.000000e+00>
  %72 = fsub <2 x double> %wide.load148, %71
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %57, i64 %offset.idx
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = fadd <2 x double> %wide.load150, %72
  %76 = fmul <2 x double> %75, <double 1.250000e-01, double 1.250000e-01>
  %77 = fadd <2 x double> %67, %76
  %78 = add nuw nsw i64 %offset.idx, 1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = bitcast double* %60 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fmul <2 x double> %wide.load152, <double 2.000000e+00, double 2.000000e+00>
  %83 = fsub <2 x double> %wide.load151, %82
  %84 = add nsw i64 %offset.idx, -1
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %84
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %wide.load153, %83
  %88 = fmul <2 x double> %87, <double 1.250000e-01, double 1.250000e-01>
  %89 = fadd <2 x double> %77, %88
  %90 = bitcast double* %60 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %wide.load154, %89
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv132, i64 %indvars.iv128, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %94 = icmp eq i64 %index.next, 118
  br i1 %94, label %for.inc203.loopexit196, label %vector.body, !llvm.loop !15

for.body112:                                      ; preds = %for.body112.preheader, %for.body112
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.body112 ], [ 1, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next133, i64 %indvars.iv128, i64 %indvars.iv124
  %95 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %indvars.iv124
  %96 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %96, 2.000000e+00
  %sub127 = fsub double %95, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %55, i64 %indvars.iv128, i64 %indvars.iv124
  %97 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %97, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv.next129, i64 %indvars.iv124
  %98 = load double, double* %arrayidx143, align 8
  %arrayidx149 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %indvars.iv124
  %99 = load double, double* %arrayidx149, align 8
  %mul150 = fmul double %99, 2.000000e+00
  %sub151 = fsub double %98, %mul150
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %57, i64 %indvars.iv124
  %100 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %100, %sub151
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %indvars.iv.next125
  %101 = load double, double* %arrayidx168, align 8
  %arrayidx174 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %indvars.iv124
  %102 = load double, double* %arrayidx174, align 8
  %mul175 = fmul double %102, 2.000000e+00
  %sub176 = fsub double %101, %mul175
  %103 = add nsw i64 %indvars.iv124, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %103
  %104 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %104, %sub176
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %arrayidx192 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv132, i64 %indvars.iv128, i64 %indvars.iv124
  %105 = load double, double* %arrayidx192, align 8
  %add193 = fadd double %105, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv132, i64 %indvars.iv128, i64 %indvars.iv124
  store double %add193, double* %arrayidx199, align 8
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 119
  br i1 %exitcond127, label %for.inc203.loopexit, label %for.body112, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.body112
  br label %for.inc203

for.inc203.loopexit196:                           ; preds = %vector.body
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit196, %for.inc203.loopexit
  %exitcond131 = icmp eq i64 %indvars.iv.next129, 119
  %indvar.next138 = add nuw nsw i64 %indvar137, 1
  br i1 %exitcond131, label %for.inc206, label %for.body112.lr.ph

for.inc206:                                       ; preds = %for.inc203
  %exitcond135 = icmp eq i64 %indvars.iv.next133, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond135, label %for.inc209, label %for.cond109.preheader.lr.ph

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.0114, 1
  %exitcond136 = icmp eq i32 %inc210, 501
  br i1 %exitcond136, label %for.end211, label %for.cond4.preheader.lr.ph

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
  %indvars.iv25 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv25, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next21, %for.inc18 ]
  %4 = add nuw nsw i64 %indvars.iv20, %3
  %5 = mul nuw nsw i64 %4, 120
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv20, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond24, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 120
  br i1 %exitcond28, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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

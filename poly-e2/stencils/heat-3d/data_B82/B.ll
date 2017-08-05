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
  tail call fastcc void @init_array([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay31 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay42 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay31, [120 x [120 x double]]* %arraydecay42)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %1)
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
  %indvars.iv2230 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.inc22 ]
  %0 = add nuw nsw i64 %indvars.iv2230, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv1727 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next18, %for.inc19 ]
  %1 = add nuw nsw i64 %0, %indvars.iv1727
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.inc ]
  %2 = sub nuw nsw i64 %1, %indvars.iv25
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv25
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv25
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv25, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1727, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next18, 120
  br i1 %exitcond21, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2230, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %storemerge17 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc98.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvar120 = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next121, %for.inc98.for.cond4.preheader_crit_edge ]
  %indvars.iv1057 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next106, %for.inc98.for.cond4.preheader_crit_edge ]
  %0 = add nuw nsw i64 %indvar120, 1
  %1 = add nuw nsw i64 %indvar120, 2
  %add = add nuw nsw i64 %indvars.iv1057, 1
  %sub23 = add nsw i64 %indvars.iv1057, -1
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.inc95.for.cond8.preheader_crit_edge, %for.cond4.preheader
  %indvar122 = phi i64 [ 0, %for.cond4.preheader ], [ %indvar.next123, %for.inc95.for.cond8.preheader_crit_edge ]
  %indvars.iv1014 = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next102, %for.inc95.for.cond8.preheader_crit_edge ]
  %2 = add nuw nsw i64 %indvar122, 1
  %scevgep124 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %2, i64 1
  %scevgep126 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %2, i64 119
  %scevgep128 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar120, i64 %2, i64 1
  %scevgep130 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %2, i64 119
  %add34 = add nuw nsw i64 %indvars.iv1014, 1
  %sub49 = add nsw i64 %indvars.iv1014, -1
  %bound0132 = icmp ult double* %scevgep124, %scevgep130
  %bound1133 = icmp ult double* %scevgep128, %scevgep126
  %memcheck.conflict135 = and i1 %bound0132, %bound1133
  br i1 %memcheck.conflict135, label %for.cond8.preheader.for.inc_crit_edge, label %for.cond8.preheader.vector.body115_crit_edge

for.cond8.preheader.vector.body115_crit_edge:     ; preds = %for.cond8.preheader
  br label %vector.body115

for.cond8.preheader.for.inc_crit_edge:            ; preds = %for.cond8.preheader
  br label %for.inc

vector.body115:                                   ; preds = %vector.body115, %for.cond8.preheader.vector.body115_crit_edge
  %index138 = phi i64 [ 0, %for.cond8.preheader.vector.body115_crit_edge ], [ %index.next139, %vector.body115 ]
  %offset.idx142 = or i64 %index138, 1
  %3 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv1014, i64 %offset.idx142
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %offset.idx142
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = fmul <2 x double> %wide.load147, <double 2.000000e+00, double 2.000000e+00>
  %8 = fsub <2 x double> %wide.load146, %7
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv1014, i64 %offset.idx142
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = fadd <2 x double> %wide.load148, %8
  %12 = fmul <2 x double> %11, <double 1.250000e-01, double 1.250000e-01>
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %add34, i64 %offset.idx142
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fsub <2 x double> %wide.load149, %7
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %sub49, i64 %offset.idx142
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %15, %wide.load150
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = fadd <2 x double> %12, %19
  %21 = add nuw nsw i64 %offset.idx142, 1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %21
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fsub <2 x double> %wide.load151, %7
  %25 = add nsw i64 %offset.idx142, -1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %24, %wide.load152
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = fadd <2 x double> %20, %29
  %31 = fadd <2 x double> %wide.load147, %30
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %offset.idx142
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next139 = add nuw nsw i64 %index138, 2
  %34 = icmp eq i64 %index.next139, 118
  br i1 %34, label %for.inc95.loopexit2, label %vector.body115, !llvm.loop !6

for.inc:                                          ; preds = %for.inc, %for.cond8.preheader.for.inc_crit_edge
  %indvars.iv2 = phi i64 [ 1, %for.cond8.preheader.for.inc_crit_edge ], [ %indvars.iv.next, %for.inc ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv1014, i64 %indvars.iv2
  %35 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %indvars.iv2
  %36 = load double, double* %arrayidx21, align 8
  %mul = fmul double %36, 2.000000e+00
  %sub22 = fsub double %35, %mul
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv1014, i64 %indvars.iv2
  %37 = load double, double* %arrayidx29, align 8
  %add30 = fadd double %37, %sub22
  %mul31 = fmul double %add30, 1.250000e-01
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %add34, i64 %indvars.iv2
  %38 = load double, double* %arrayidx38, align 8
  %sub46 = fsub double %38, %mul
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %sub49, i64 %indvars.iv2
  %39 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %sub46, %39
  %mul55 = fmul double %add54, 1.250000e-01
  %add56 = fadd double %mul31, %mul55
  %add61 = add nuw nsw i64 %indvars.iv2, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %add61
  %40 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %40, %mul
  %sub76 = add nsw i64 %indvars.iv2, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %sub76
  %41 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %41
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %36, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv1057, i64 %indvars.iv1014, i64 %indvars.iv2
  store double %add88, double* %arrayidx94, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.loopexit, label %for.inc, !llvm.loop !9

for.inc95.loopexit:                               ; preds = %for.inc
  br label %for.inc95

for.inc95.loopexit2:                              ; preds = %vector.body115
  br label %for.inc95

for.inc95:                                        ; preds = %for.inc95.loopexit2, %for.inc95.loopexit
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv1014, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, 119
  br i1 %exitcond104, label %for.inc98, label %for.inc95.for.cond8.preheader_crit_edge

for.inc95.for.cond8.preheader_crit_edge:          ; preds = %for.inc95
  %indvar.next123 = add nuw nsw i64 %indvar122, 1
  br label %for.cond8.preheader

for.inc98:                                        ; preds = %for.inc95
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv1057, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next106, 119
  br i1 %exitcond97, label %for.inc98.for.cond105.preheader_crit_edge, label %for.inc98.for.cond4.preheader_crit_edge

for.inc98.for.cond4.preheader_crit_edge:          ; preds = %for.inc98
  %indvar.next121 = add nuw nsw i64 %indvar120, 1
  br label %for.cond4.preheader

for.inc98.for.cond105.preheader_crit_edge:        ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.inc206.for.cond105.preheader_crit_edge, %for.inc98.for.cond105.preheader_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.inc206.for.cond105.preheader_crit_edge ], [ 0, %for.inc98.for.cond105.preheader_crit_edge ]
  %indvars.iv11515 = phi i64 [ %indvars.iv.next116, %for.inc206.for.cond105.preheader_crit_edge ], [ 1, %for.inc98.for.cond105.preheader_crit_edge ]
  %42 = add nuw nsw i64 %indvar, 1
  %43 = add nuw nsw i64 %indvar, 2
  %add113 = add nuw nsw i64 %indvars.iv11515, 1
  %sub128 = add nsw i64 %indvars.iv11515, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.inc203.for.cond109.preheader_crit_edge, %for.cond105.preheader
  %indvar100 = phi i64 [ 0, %for.cond105.preheader ], [ %indvar.next101, %for.inc203.for.cond109.preheader_crit_edge ]
  %indvars.iv11112 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next112, %for.inc203.for.cond109.preheader_crit_edge ]
  %44 = add nuw nsw i64 %indvar100, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %42, i64 %44, i64 1
  %scevgep103 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %42, i64 %44, i64 119
  %scevgep105 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %44, i64 1
  %scevgep107 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %43, i64 %44, i64 119
  %add139 = add nuw nsw i64 %indvars.iv11112, 1
  %sub154 = add nsw i64 %indvars.iv11112, -1
  %bound0 = icmp ult double* %scevgep, %scevgep107
  %bound1 = icmp ult double* %scevgep105, %scevgep103
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.cond109.preheader.for.inc200_crit_edge, label %for.cond109.preheader.vector.body_crit_edge

for.cond109.preheader.vector.body_crit_edge:      ; preds = %for.cond109.preheader
  br label %vector.body

for.cond109.preheader.for.inc200_crit_edge:       ; preds = %for.cond109.preheader
  br label %for.inc200

vector.body:                                      ; preds = %vector.body, %for.cond109.preheader.vector.body_crit_edge
  %index = phi i64 [ 0, %for.cond109.preheader.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %offset.idx = or i64 %index, 1
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv11112, i64 %offset.idx
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !10
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %offset.idx
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !10
  %49 = fmul <2 x double> %wide.load109, <double 2.000000e+00, double 2.000000e+00>
  %50 = fsub <2 x double> %wide.load, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv11112, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = fadd <2 x double> %wide.load110, %50
  %54 = fmul <2 x double> %53, <double 1.250000e-01, double 1.250000e-01>
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %add139, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fsub <2 x double> %wide.load111, %49
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %sub154, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fadd <2 x double> %57, %wide.load112
  %61 = fmul <2 x double> %60, <double 1.250000e-01, double 1.250000e-01>
  %62 = fadd <2 x double> %54, %61
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %63
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fsub <2 x double> %wide.load113, %49
  %67 = add nsw i64 %offset.idx, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fadd <2 x double> %66, %wide.load114
  %71 = fmul <2 x double> %70, <double 1.250000e-01, double 1.250000e-01>
  %72 = fadd <2 x double> %62, %71
  %73 = fadd <2 x double> %wide.load109, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %76 = icmp eq i64 %index.next, 118
  br i1 %76, label %for.inc203.loopexit1, label %vector.body, !llvm.loop !15

for.inc200:                                       ; preds = %for.inc200, %for.cond109.preheader.for.inc200_crit_edge
  %indvars.iv10710 = phi i64 [ 1, %for.cond109.preheader.for.inc200_crit_edge ], [ %indvars.iv.next108, %for.inc200 ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv11112, i64 %indvars.iv10710
  %77 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %indvars.iv10710
  %78 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %78, 2.000000e+00
  %sub127 = fsub double %77, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv11112, i64 %indvars.iv10710
  %79 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %79, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %add139, i64 %indvars.iv10710
  %80 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %80, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %sub154, i64 %indvars.iv10710
  %81 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %81
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %add166 = add nuw nsw i64 %indvars.iv10710, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %add166
  %82 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %82, %mul126
  %sub181 = add nsw i64 %indvars.iv10710, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %sub181
  %83 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %83
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %78, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv11515, i64 %indvars.iv11112, i64 %indvars.iv10710
  store double %add193, double* %arrayidx199, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv10710, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 119
  br i1 %exitcond110, label %for.inc203.loopexit, label %for.inc200, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.inc200
  br label %for.inc203

for.inc203.loopexit1:                             ; preds = %vector.body
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit1, %for.inc203.loopexit
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv11112, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next112, 119
  br i1 %exitcond114, label %for.inc206, label %for.inc203.for.cond109.preheader_crit_edge

for.inc203.for.cond109.preheader_crit_edge:       ; preds = %for.inc203
  %indvar.next101 = add nuw nsw i64 %indvar100, 1
  br label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv11515, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next116, 119
  br i1 %exitcond99, label %for.inc209, label %for.inc206.for.cond105.preheader_crit_edge

for.inc206.for.cond105.preheader_crit_edge:       ; preds = %for.inc206
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %storemerge17, 1
  %exitcond117 = icmp eq i32 %inc210, 501
  br i1 %exitcond117, label %for.end211, label %for.cond1.preheader

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
  %indvars.iv1827 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv1827, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv1424 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next15, %for.inc18 ]
  %mul83 = add nuw nsw i64 %indvars.iv1424, %3
  %add = mul nuw nsw i64 %mul83, 120
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv22 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv22, %add
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
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1827, i64 %indvars.iv1424, i64 %indvars.iv22
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1424, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 120
  br i1 %exitcond17, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next19, 120
  br i1 %exitcond29, label %for.end23, label %for.cond2.preheader

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

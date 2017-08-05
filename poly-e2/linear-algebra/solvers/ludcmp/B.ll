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
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv105 = phi i64 [ 0, %entry ], [ %indvars.iv.next106.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv105
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv105
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %0 = trunc i64 %indvars.iv.next106 to i32
  %conv4 = sitofp i32 %0 to double
  %div = fdiv double %conv4, 2.000000e+03
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv105
  store double %add6, double* %arrayidx8, align 8
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next106
  store double 0.000000e+00, double* %arrayidx.1, align 8
  %arrayidx3.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next106
  store double 0.000000e+00, double* %arrayidx3.1, align 8
  %indvars.iv.next106.1 = add nuw nsw i64 %indvars.iv105, 2
  %1 = trunc i64 %indvars.iv.next106.1 to i32
  %conv4.1 = sitofp i32 %1 to double
  %div.1 = fdiv double %conv4.1, 2.000000e+03
  %div5.1 = fmul double %div.1, 5.000000e-01
  %add6.1 = fadd double %div5.1, 4.000000e+00
  %arrayidx8.1 = getelementptr inbounds double, double* %b, i64 %indvars.iv.next106
  store double %add6.1, double* %arrayidx8.1, align 8
  %exitcond107.1 = icmp eq i64 %indvars.iv.next106, 1999
  br i1 %exitcond107.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39.for.cond13.preheader_crit_edge
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.end39.for.cond13.preheader_crit_edge ], [ 0, %for.body16.lr.ph.preheader ]
  %2 = shl i64 %indvars.iv103, 32
  %sext = add i64 %2, 4294967296
  %3 = sub i64 1998, %indvars.iv103
  br label %for.body16

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %4 = sub nsw i64 0, %indvars.iv89
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv89
  store double %add20, double* %arrayidx24, align 8
  %exitcond94 = icmp eq i64 %indvars.iv89, %indvars.iv103
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  br i1 %exitcond94, label %for.end27, label %for.body16

for.end27:                                        ; preds = %for.body16
  %6 = ashr exact i64 %sext, 32
  %7 = shl i64 %3, 3
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %cmp3070 = icmp slt i64 %indvars.iv.next104, 2000
  br i1 %cmp3070, label %for.end39.for.cond13.preheader_crit_edge, label %for.end46

for.end39.for.cond13.preheader_crit_edge:         ; preds = %for.end27
  %8 = and i64 %7, 34359738360
  %scevgep101 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %6
  %9 = add nuw nsw i64 %8, 8
  %scevgep101102 = bitcast double* %scevgep101 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep101102, i8 0, i64 %9, i32 8, i1 false)
  %arrayidx43110 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv103
  store double 1.000000e+00, double* %arrayidx43110, align 8
  br label %for.body16.lr.ph

for.end46:                                        ; preds = %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv103
  store double 1.000000e+00, double* %arrayidx43, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62

for.inc62:                                        ; preds = %for.inc62, %for.end46
  %indvars.iv87 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next88.7, %for.inc62 ]
  %10 = mul nuw nsw i64 %indvars.iv87, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88 = or i64 %indvars.iv87, 1
  %11 = mul nuw nsw i64 %indvars.iv.next88, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.1 = or i64 %indvars.iv87, 2
  %12 = mul nuw nsw i64 %indvars.iv.next88.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.2 = or i64 %indvars.iv87, 3
  %13 = mul nuw nsw i64 %indvars.iv.next88.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.3 = or i64 %indvars.iv87, 4
  %14 = mul nuw nsw i64 %indvars.iv.next88.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.4 = or i64 %indvars.iv87, 5
  %15 = mul nuw nsw i64 %indvars.iv.next88.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.5 = or i64 %indvars.iv87, 6
  %16 = mul nuw nsw i64 %indvars.iv.next88.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.6 = or i64 %indvars.iv87, 7
  %17 = mul nuw nsw i64 %indvars.iv.next88.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.7 = add nuw nsw i64 %indvars.iv87, 8
  %exitcond43.7 = icmp eq i64 %indvars.iv.next88.7, 2000
  br i1 %exitcond43.7, label %for.inc62.for.cond69.preheader_crit_edge, label %for.inc62

for.inc62.for.cond69.preheader_crit_edge:         ; preds = %for.inc62
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.inc96, %for.inc62.for.cond69.preheader_crit_edge
  %indvars.iv82 = phi i64 [ 0, %for.inc62.for.cond69.preheader_crit_edge ], [ %indvars.iv.next83, %for.inc96 ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv82
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %19 = add nuw nsw i64 %indvars.iv82, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %19
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.inc93, %for.cond69.preheader
  %indvars.iv80 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next81, %for.inc93 ]
  %20 = mul nuw nsw i64 %indvars.iv80, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %20
  %21 = add nuw nsw i64 %20, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %21
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv80, i64 %indvars.iv82
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80 to i8*
  %bc7 = bitcast double* %arrayidx80 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.body76.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

for.body76.preheader:                             ; preds = %for.cond73.preheader
  br label %for.body76

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx80, align 8, !alias.scope !1
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv82
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %22, i64 %indvars.iv82
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %23, i64 %indvars.iv82
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %24, i64 %indvars.iv82
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %27, %39
  %43 = fmul <2 x double> %29, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv80, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = fadd <2 x double> %wide.load, %42
  %49 = fadd <2 x double> %wide.load12, %43
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %52 = icmp eq i64 %index.next, 2000
  br i1 %52, label %for.inc93.loopexit45, label %vector.body, !llvm.loop !9

for.body76:                                       ; preds = %for.body76, %for.body76.preheader
  %indvars.iv77 = phi i64 [ 0, %for.body76.preheader ], [ %indvars.iv.next78.1, %for.body76 ]
  %53 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv82
  %54 = load double, double* %arrayidx84, align 8
  %mul = fmul double %53, %54
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv80, i64 %indvars.iv77
  %55 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %55, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %56 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next78, i64 %indvars.iv82
  %57 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %56, %57
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv80, i64 %indvars.iv.next78
  %58 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %58, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %exitcond79.1 = icmp eq i64 %indvars.iv.next78, 1999
  %indvars.iv.next78.1 = add nuw nsw i64 %indvars.iv77, 2
  br i1 %exitcond79.1, label %for.inc93.loopexit, label %for.body76, !llvm.loop !12

for.inc93.loopexit:                               ; preds = %for.body76
  br label %for.inc93

for.inc93.loopexit45:                             ; preds = %vector.body
  br label %for.inc93

for.inc93:                                        ; preds = %for.inc93.loopexit45, %for.inc93.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond41, label %for.inc96, label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next83, 2000
  br i1 %exitcond42, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.cond103.preheader.preheader, %for.inc118
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc118 ], [ 0, %for.cond103.preheader.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %59 = add nuw nsw i64 %indvars.iv75, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %59, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %60 = mul nuw nsw i64 %indvars.iv75, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %60
  %61 = add nuw nsw i64 %60, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %61
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.body106.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader
  br label %vector.body13

for.body106.preheader:                            ; preds = %for.cond103.preheader
  br label %for.body106

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %index30
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !13
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !13
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %index30
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %67, align 8, !alias.scope !16, !noalias !13
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %69, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %index.next31
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !13
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !13
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %index.next31
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %75, align 8, !alias.scope !16, !noalias !13
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %77, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nuw nsw i64 %index30, 8
  %78 = icmp eq i64 %index.next31.1, 2000
  br i1 %78, label %for.inc118.loopexit44, label %vector.body13, !llvm.loop !18

for.body106:                                      ; preds = %for.body106, %for.body106.preheader
  %indvars.iv = phi i64 [ 0, %for.body106.preheader ], [ %indvars.iv.next.4, %for.body106 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %79 = bitcast double* %arrayidx110 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv
  %81 = bitcast double* %arrayidx114 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx110.1 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx114.1 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx110.2 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx114.2 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx110.3 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx114.3 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx110.4 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx114.4 to i64*
  store i64 %92, i64* %93, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.inc118.loopexit, label %for.body106, !llvm.loop !19

for.inc118.loopexit:                              ; preds = %for.body106
  br label %for.inc118

for.inc118.loopexit44:                            ; preds = %vector.body13
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118.loopexit44, %for.inc118.loopexit
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond40, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv124 = phi i32 [ %indvars.iv.next125, %for.inc58 ], [ -1, %entry ]
  %0 = add nuw nsw i64 %indvars.iv2, 4294967295
  %1 = and i64 %0, 4294967295
  %cmp291 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp291, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  %wide.trip.count126 = zext i32 %indvars.iv124 to i64
  %2 = and i64 %0, 1
  %lcmp.mod13 = icmp eq i64 %2, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %3 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.end50.us, %for.body30.us.preheader
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.end50.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv130
  %4 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod13, label %for.body37.us.prol.preheader, label %for.body37.us.prol.loopexit.unr-lcssa

for.body37.us.prol.preheader:                     ; preds = %for.body30.us
  br label %for.body37.us.prol

for.body37.us.prol:                               ; preds = %for.body37.us.prol.preheader
  %5 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv130
  %6 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %4, %mul46.us.prol
  br label %for.body37.us.prol.loopexit.unr-lcssa

for.body37.us.prol.loopexit.unr-lcssa:            ; preds = %for.body30.us, %for.body37.us.prol
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv122.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %w.195.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %4, %for.body30.us ]
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol.loopexit.unr-lcssa
  br i1 %3, label %for.end50.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body30.us.new
  %indvars.iv122 = phi i64 [ %indvars.iv122.unr.ph, %for.body30.us.new ], [ %indvars.iv.next123.1, %for.body37.us ]
  %w.195.us = phi double [ %w.195.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv122
  %7 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv122, i64 %indvars.iv130
  %8 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %7, %8
  %sub47.us = fsub double %w.195.us, %mul46.us
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next123
  %9 = load double, double* %arrayidx41.us.1, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next123, i64 %indvars.iv130
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.1 = fmul double %9, %10
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.1
  %exitcond127.1 = icmp eq i64 %indvars.iv.next123, %wide.trip.count126
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv122, 2
  br i1 %exitcond127.1, label %for.end50.us.unr-lcssa, label %for.body37.us

for.end50.us.unr-lcssa:                           ; preds = %for.body37.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.body37.us.prol.loopexit, %for.end50.us.unr-lcssa
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.end50.us.unr-lcssa ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next131, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %for.end ], [ 0, %for.body3.preheader ]
  %indvars.iv115 = phi i32 [ %indvars.iv.next116, %for.end ], [ -1, %for.body3.preheader ]
  %11 = add nuw nsw i64 %indvars.iv119, 4294967295
  %12 = and i64 %11, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv119
  %13 = load double, double* %arrayidx5, align 8
  %cmp787 = icmp sgt i64 %indvars.iv119, 0
  br i1 %cmp787, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %wide.trip.count117 = zext i32 %indvars.iv115 to i64
  %14 = and i64 %11, 1
  %lcmp.mod11 = icmp eq i64 %14, 0
  br i1 %lcmp.mod11, label %for.body8.prol.preheader, label %for.body8.prol.loopexit.unr-lcssa

for.body8.prol.preheader:                         ; preds = %for.body8.preheader
  br label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.prol.preheader
  %15 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv119
  %16 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %15, %16
  %sub.prol = fsub double %13, %mul.prol
  br label %for.body8.prol.loopexit.unr-lcssa

for.body8.prol.loopexit.unr-lcssa:                ; preds = %for.body8.preheader, %for.body8.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %indvars.iv113.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %w.089.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %13, %for.body8.preheader ]
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %12, 0
  br i1 %17, label %for.end.loopexit, label %for.body8.preheader.new

for.body8.preheader.new:                          ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.new
  %indvars.iv113 = phi i64 [ %indvars.iv113.unr.ph, %for.body8.preheader.new ], [ %indvars.iv.next114.1, %for.body8 ]
  %w.089 = phi double [ %w.089.unr.ph, %for.body8.preheader.new ], [ %sub.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv113
  %18 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv119
  %19 = load double, double* %arrayidx16, align 8
  %mul = fmul double %18, %19
  %sub = fsub double %w.089, %mul
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next114
  %20 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next114, i64 %indvars.iv119
  %21 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %20, %21
  %sub.1 = fsub double %sub, %mul.1
  %exitcond118.1 = icmp eq i64 %indvars.iv.next114, %wide.trip.count117
  %indvars.iv.next114.1 = add nsw i64 %indvars.iv113, 2
  br i1 %exitcond118.1, label %for.end.loopexit.unr-lcssa, label %for.body8

for.end.loopexit.unr-lcssa:                       ; preds = %for.body8
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body8.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %w.0.lcssa = phi double [ %13, %for.body3 ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %indvars.iv119
  %22 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %22
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %indvars.iv.next116 = add nsw i32 %indvars.iv115, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next120, %indvars.iv2
  br i1 %exitcond4, label %for.body30.us.preheader, label %for.body3

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next125 = add nsw i32 %indvars.iv124, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv = phi i2 [ 0, %for.body63.preheader ], [ %indvars.iv.next, %for.end79 ]
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.end79 ], [ 0, %for.body63.preheader ]
  %indvars.iv108 = phi i32 [ %indvars.iv.next109, %for.end79 ], [ -1, %for.body63.preheader ]
  %23 = zext i2 %indvars.iv to i64
  %24 = add nuw nsw i64 %indvars.iv111, 4294967295
  %25 = and i64 %24, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv111
  %26 = load double, double* %arrayidx65, align 8
  %cmp6782 = icmp sgt i64 %indvars.iv111, 0
  br i1 %cmp6782, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %wide.trip.count = zext i32 %indvars.iv108 to i64
  %xtraiter7 = and i64 %indvars.iv111, 3
  %lcmp.mod8 = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod8, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %indvars.iv106.prol = phi i64 [ %indvars.iv.next107.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %w.284.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %26, %for.body68.prol.preheader ]
  %prol.iter9 = phi i64 [ %prol.iter9.sub, %for.body68.prol ], [ %xtraiter7, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv106.prol
  %27 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv106.prol
  %28 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %27, %28
  %sub76.prol = fsub double %w.284.prol, %mul75.prol
  %indvars.iv.next107.prol = add nuw nsw i64 %indvars.iv106.prol, 1
  %prol.iter9.sub = add nsw i64 %prol.iter9, -1
  %prol.iter9.cmp = icmp eq i64 %prol.iter9.sub, 0
  br i1 %prol.iter9.cmp, label %for.body68.prol.loopexit.unr-lcssa, label %for.body68.prol, !llvm.loop !20

for.body68.prol.loopexit.unr-lcssa:               ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.preheader, %for.body68.prol.loopexit.unr-lcssa
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.unr-lcssa ]
  %indvars.iv106.unr = phi i64 [ 0, %for.body68.preheader ], [ %23, %for.body68.prol.loopexit.unr-lcssa ]
  %w.284.unr = phi double [ %26, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.unr-lcssa ]
  %29 = icmp ult i64 %25, 3
  br i1 %29, label %for.end79.loopexit, label %for.body68.preheader.new

for.body68.preheader.new:                         ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.preheader.new
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr, %for.body68.preheader.new ], [ %indvars.iv.next107.3, %for.body68 ]
  %w.284 = phi double [ %w.284.unr, %for.body68.preheader.new ], [ %sub76.3, %for.body68 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv106
  %30 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv106
  %31 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %30, %31
  %sub76 = fsub double %w.284, %mul75
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv.next107
  %32 = load double, double* %arrayidx72.1, align 8
  %arrayidx74.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next107
  %33 = load double, double* %arrayidx74.1, align 8
  %mul75.1 = fmul double %32, %33
  %sub76.1 = fsub double %sub76, %mul75.1
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv.next107.1
  %34 = load double, double* %arrayidx72.2, align 8
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next107.1
  %35 = load double, double* %arrayidx74.2, align 8
  %mul75.2 = fmul double %34, %35
  %sub76.2 = fsub double %sub76.1, %mul75.2
  %indvars.iv.next107.2 = add nsw i64 %indvars.iv106, 3
  %arrayidx72.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv.next107.2
  %36 = load double, double* %arrayidx72.3, align 8
  %arrayidx74.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next107.2
  %37 = load double, double* %arrayidx74.3, align 8
  %mul75.3 = fmul double %36, %37
  %sub76.3 = fsub double %sub76.2, %mul75.3
  %exitcond110.3 = icmp eq i64 %indvars.iv.next107.2, %wide.trip.count
  %indvars.iv.next107.3 = add nsw i64 %indvars.iv106, 4
  br i1 %exitcond110.3, label %for.end79.loopexit.unr-lcssa, label %for.body68

for.end79.loopexit.unr-lcssa:                     ; preds = %for.body68
  br label %for.end79.loopexit

for.end79.loopexit:                               ; preds = %for.body68.prol.loopexit, %for.end79.loopexit.unr-lcssa
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit.unr-lcssa ]
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body63
  %w.2.lcssa = phi double [ %26, %for.body63 ], [ %sub76.lcssa, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv111
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %indvars.iv.next109 = add nsw i32 %indvars.iv108, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next112, 2000
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104.for.body88_crit_edge
  %indvars.iv16 = phi i2 [ 0, %for.body88.preheader ], [ %indvars.iv.next17, %for.end104.for.body88_crit_edge ]
  %indvars.iv14 = phi i32 [ 2000, %for.body88.preheader ], [ %indvars.iv.next15, %for.end104.for.body88_crit_edge ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104.for.body88_crit_edge ]
  %indvars.iv103 = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next104, %for.end104.for.body88_crit_edge ]
  %38 = sext i32 %indvars.iv14 to i64
  %39 = zext i2 %indvars.iv16 to i64
  %40 = add i64 %38, %39
  %41 = sub i32 2000, %indvar
  %42 = sext i32 %41 to i64
  %43 = sub nsw i64 1999, %42
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv103
  %44 = load double, double* %arrayidx90, align 8
  %45 = add nsw i64 %indvars.iv103, 1
  %cmp9278 = icmp slt i64 %45, 2000
  br i1 %cmp9278, label %for.body88.for.body93_crit_edge, label %for.end104.thread

for.end104.thread:                                ; preds = %for.body88
  %arrayidx108135 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv103
  %46 = load double, double* %arrayidx108135, align 8
  %div109136 = fdiv double %44, %46
  %arrayidx111137 = getelementptr inbounds double, double* %x, i64 %indvars.iv103
  store double %div109136, double* %arrayidx111137, align 8
  br label %for.end104.for.body88_crit_edge

for.body88.for.body93_crit_edge:                  ; preds = %for.body88
  %47 = sext i32 %indvars.iv14 to i64
  %48 = sub nsw i64 0, %42
  %xtraiter = and i64 %48, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body88.for.body93_crit_edge
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv101.prol = phi i64 [ %indvars.iv.next102.prol, %for.body93.prol ], [ %47, %for.body93.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %44, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv101.prol
  %49 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv101.prol
  %50 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %49, %50
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next102.prol = add nsw i64 %indvars.iv101.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.unr-lcssa, label %for.body93.prol, !llvm.loop !22

for.body93.prol.loopexit.unr-lcssa:               ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body88.for.body93_crit_edge, %for.body93.prol.loopexit.unr-lcssa
  %sub101.lcssa.unr = phi double [ undef, %for.body88.for.body93_crit_edge ], [ %sub101.prol, %for.body93.prol.loopexit.unr-lcssa ]
  %indvars.iv101.unr = phi i64 [ %47, %for.body88.for.body93_crit_edge ], [ %40, %for.body93.prol.loopexit.unr-lcssa ]
  %w.379.unr = phi double [ %44, %for.body88.for.body93_crit_edge ], [ %sub101.prol, %for.body93.prol.loopexit.unr-lcssa ]
  %51 = icmp ult i64 %43, 3
  br i1 %51, label %for.end104, label %for.body88.for.body93_crit_edge.new

for.body88.for.body93_crit_edge.new:              ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body88.for.body93_crit_edge.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr, %for.body88.for.body93_crit_edge.new ], [ %indvars.iv.next102.3, %for.body93 ]
  %w.379 = phi double [ %w.379.unr, %for.body88.for.body93_crit_edge.new ], [ %sub101.3, %for.body93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv101
  %52 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv101
  %53 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %52, %53
  %sub101 = fsub double %w.379, %mul100
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %arrayidx97.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv.next102
  %54 = load double, double* %arrayidx97.1, align 8
  %arrayidx99.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next102
  %55 = load double, double* %arrayidx99.1, align 8
  %mul100.1 = fmul double %54, %55
  %sub101.1 = fsub double %sub101, %mul100.1
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv.next102.1
  %56 = load double, double* %arrayidx97.2, align 8
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next102.1
  %57 = load double, double* %arrayidx99.2, align 8
  %mul100.2 = fmul double %56, %57
  %sub101.2 = fsub double %sub101.1, %mul100.2
  %indvars.iv.next102.2 = add nsw i64 %indvars.iv101, 3
  %arrayidx97.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv.next102.2
  %58 = load double, double* %arrayidx97.3, align 8
  %arrayidx99.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next102.2
  %59 = load double, double* %arrayidx99.3, align 8
  %mul100.3 = fmul double %58, %59
  %sub101.3 = fsub double %sub101.2, %mul100.3
  %exitcond.3 = icmp eq i64 %indvars.iv.next102.2, 1999
  %indvars.iv.next102.3 = add nsw i64 %indvars.iv101, 4
  br i1 %exitcond.3, label %for.end104.unr-lcssa, label %for.body93

for.end104.unr-lcssa:                             ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.body93.prol.loopexit, %for.end104.unr-lcssa
  %sub101.lcssa = phi double [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.unr-lcssa ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv103
  %60 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa, %60
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv103
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv103, 0
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113

for.end104.for.body88_crit_edge:                  ; preds = %for.end104.thread, %for.end104
  %indvars.iv.next104 = add i64 %indvars.iv103, -1
  %indvars.iv.next15 = add i32 %indvars.iv14, -1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next17 = add i2 %indvars.iv16, 1
  br label %for.body88

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}

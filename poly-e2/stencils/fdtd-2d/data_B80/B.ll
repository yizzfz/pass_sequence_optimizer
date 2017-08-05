; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  %3 = bitcast i8* %call to [1200 x double]*
  tail call void @print_array([1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv813 = phi i64 [ 0, %entry ], [ %indvars.iv.next9.4, %for.body ]
  %0 = trunc i64 %indvars.iv813 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv813
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv813, 1
  %1 = trunc i64 %indvars.iv.next9 to i32
  %conv.1 = sitofp i32 %1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv813, 2
  %2 = trunc i64 %indvars.iv.next9.1 to i32
  %conv.2 = sitofp i32 %2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next9.2 = add nsw i64 %indvars.iv813, 3
  %3 = trunc i64 %indvars.iv.next9.2 to i32
  %conv.3 = sitofp i32 %3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv813, 4
  %4 = trunc i64 %indvars.iv.next9.3 to i32
  %conv.4 = sitofp i32 %4 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next9.4 = add nsw i64 %indvars.iv813, 5
  %exitcond10.4 = icmp eq i64 %indvars.iv.next9.4, 500
  br i1 %exitcond10.4, label %for.cond5.preheader.preheader, label %for.body

for.cond5.preheader.preheader:                    ; preds = %for.body
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.end38
  %indvars.iv512 = phi i64 [ %indvars.iv.next6, %for.end38 ], [ 0, %for.cond5.preheader.preheader ]
  %5 = trunc i64 %indvars.iv512 to i32
  %conv9 = sitofp i32 %5 to double
  %6 = insertelement <2 x double> undef, double %conv9, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %conv10 = sitofp i32 %7 to double
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv512, i64 %indvars.iv11
  %8 = add nuw nsw i64 %indvars.iv11, 2
  %9 = trunc i64 %8 to i32
  %conv18 = sitofp i32 %9 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv10, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv18, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %div = fdiv <2 x double> %mul, <double 1.000000e+03, double 1.200000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx15, align 8
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv512, i64 %indvars.iv11
  store double %div.v.r2, double* %arrayidx25, align 8
  %10 = add nuw nsw i64 %indvars.iv11, 3
  %11 = trunc i64 %10 to i32
  %conv28 = sitofp i32 %11 to double
  %mul29 = fmul double %conv9, %conv28
  %div31 = fdiv double %mul29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv512, i64 %indvars.iv11
  store double %div31, double* %arrayidx35, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.end38, label %for.body8

for.end38:                                        ; preds = %for.body8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv512, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %for.end41, label %for.cond5.preheader

for.end41:                                        ; preds = %for.end38
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* %_fict_) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end112, %entry
  %indvars.iv4353 = phi i64 [ 0, %entry ], [ %indvars.iv.next44, %for.end112 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr93 = mul i64 %indvars.iv4353, 8
  %sunkaddr94 = add i64 %sunkaddr, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to i64*
  %0 = load i64, i64* %sunkaddr95, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv46
  %1 = bitcast double* %arrayidx6 to i64*
  store i64 %0, i64* %1, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv46, 1
  %sunkaddr96 = ptrtoint double* %_fict_ to i64
  %sunkaddr97 = mul i64 %indvars.iv4353, 8
  %sunkaddr98 = add i64 %sunkaddr96, %sunkaddr97
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i64*
  %2 = load i64, i64* %sunkaddr99, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %3 = bitcast double* %arrayidx6.1 to i64*
  store i64 %2, i64* %3, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv46, 2
  %sunkaddr100 = ptrtoint double* %_fict_ to i64
  %sunkaddr101 = mul i64 %indvars.iv4353, 8
  %sunkaddr102 = add i64 %sunkaddr100, %sunkaddr101
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i64*
  %4 = load i64, i64* %sunkaddr103, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx6.2 to i64*
  store i64 %4, i64* %5, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv46, 3
  %sunkaddr104 = ptrtoint double* %_fict_ to i64
  %sunkaddr105 = mul i64 %indvars.iv4353, 8
  %sunkaddr106 = add i64 %sunkaddr104, %sunkaddr105
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i64*
  %6 = load i64, i64* %sunkaddr107, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %7 = bitcast double* %arrayidx6.3 to i64*
  store i64 %6, i64* %7, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv46, 4
  %sunkaddr108 = ptrtoint double* %_fict_ to i64
  %sunkaddr109 = mul i64 %indvars.iv4353, 8
  %sunkaddr110 = add i64 %sunkaddr108, %sunkaddr109
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i64*
  %8 = load i64, i64* %sunkaddr111, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %9 = bitcast double* %arrayidx6.4 to i64*
  store i64 %8, i64* %9, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv46, 5
  %exitcond54.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond54.4, label %for.cond10.preheader.preheader, label %for.body3

for.cond10.preheader.preheader:                   ; preds = %for.body3
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond10.preheader.preheader, %for.end33
  %indvar = phi i64 [ %10, %for.end33 ], [ 0, %for.cond10.preheader.preheader ]
  %indvars.iv2748 = phi i64 [ %indvars.iv.next28, %for.end33 ], [ 1, %for.cond10.preheader.preheader ]
  %10 = add i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %10, i64 0
  %11 = add i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %11, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %11, i64 0
  %12 = add nsw i64 %indvars.iv2748, -1
  %bound072 = icmp ult double* %scevgep63, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep65
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %for.body12.preheader, label %vector.body58.preheader

vector.body58.preheader:                          ; preds = %for.cond10.preheader
  br label %vector.body58

for.body12.preheader:                             ; preds = %for.cond10.preheader
  br label %for.body12

vector.body58:                                    ; preds = %vector.body58.preheader, %vector.body58
  %index78 = phi i64 [ %index.next79, %vector.body58 ], [ 0, %vector.body58.preheader ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2748, i64 %index78
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1, !noalias !4
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2748, i64 %index78
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !4
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !4
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %12, i64 %index78
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !4
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !4
  %25 = fsub <2 x double> %wide.load88, %wide.load90
  %26 = fsub <2 x double> %wide.load89, %wide.load91
  %27 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %28 = fmul <2 x double> %26, <double 5.000000e-01, double 5.000000e-01>
  %29 = fsub <2 x double> %wide.load86, %27
  %30 = fsub <2 x double> %wide.load87, %28
  store <2 x double> %29, <2 x double>* %14, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %30, <2 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %index.next79 = add i64 %index78, 4
  %31 = icmp eq i64 %index.next79, 1200
  br i1 %31, label %for.end33.loopexit112, label %vector.body58, !llvm.loop !6

for.body12:                                       ; preds = %for.body12, %for.body12.preheader
  %indvars.iv2547 = phi i64 [ 0, %for.body12.preheader ], [ %indvars.iv.next26.1, %for.body12 ]
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2748, i64 %indvars.iv2547
  %32 = load double, double* %arrayidx16, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2748, i64 %indvars.iv2547
  %33 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %12, i64 %indvars.iv2547
  %34 = load double, double* %arrayidx24, align 8
  %sub25 = fsub double %33, %34
  %mul = fmul double %sub25, 5.000000e-01
  %sub26 = fsub double %32, %mul
  store double %sub26, double* %arrayidx16, align 8
  %indvars.iv.next26 = or i64 %indvars.iv2547, 1
  %arrayidx16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2748, i64 %indvars.iv.next26
  %35 = load double, double* %arrayidx16.1, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2748, i64 %indvars.iv.next26
  %36 = load double, double* %arrayidx20.1, align 8
  %arrayidx24.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %12, i64 %indvars.iv.next26
  %37 = load double, double* %arrayidx24.1, align 8
  %sub25.1 = fsub double %36, %37
  %mul.1 = fmul double %sub25.1, 5.000000e-01
  %sub26.1 = fsub double %35, %mul.1
  store double %sub26.1, double* %arrayidx16.1, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv2547, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next26.1, 1200
  br i1 %exitcond.1, label %for.end33.loopexit, label %for.body12, !llvm.loop !9

for.end33.loopexit:                               ; preds = %for.body12
  br label %for.end33

for.end33.loopexit112:                            ; preds = %vector.body58
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit112, %for.end33.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2748, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond30, label %for.cond40.preheader.preheader, label %for.cond10.preheader

for.cond40.preheader.preheader:                   ; preds = %for.end33
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.preheader, %for.end65
  %indvars.iv3450 = phi i64 [ %38, %for.end65 ], [ 0, %for.cond40.preheader.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3450, i64 1
  %38 = add i64 %indvars.iv3450, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %38, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %38, i64 0
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %for.body42.preheader.new, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %for.cond40.preheader
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index44, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3450, i64 %offset.idx
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !10, !noalias !13
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10, !noalias !13
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %offset.idx
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !13
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !13
  %47 = add nsw i64 %offset.idx, -1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !13
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !13
  %52 = fsub <2 x double> %wide.load54, %wide.load56
  %53 = fsub <2 x double> %wide.load55, %wide.load57
  %54 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %55 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %wide.load52, %54
  %57 = fsub <2 x double> %wide.load53, %55
  store <2 x double> %56, <2 x double>* %40, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %57, <2 x double>* %42, align 8, !alias.scope !10, !noalias !13
  %index.next45 = add i64 %index44, 4
  %58 = icmp eq i64 %index.next45, 1196
  br i1 %58, label %for.body42.preheader.new.loopexit, label %vector.body25, !llvm.loop !15

for.body42.preheader.new.loopexit:                ; preds = %vector.body25
  br label %for.body42.preheader.new

for.body42.preheader.new:                         ; preds = %for.body42.preheader.new.loopexit, %for.cond40.preheader
  %indvars.iv3149.ph = phi i64 [ 1, %for.cond40.preheader ], [ 1197, %for.body42.preheader.new.loopexit ]
  %arrayidx46.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3450, i64 %indvars.iv3149.ph
  %59 = load double, double* %arrayidx46.prol, align 8
  %arrayidx50.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %indvars.iv3149.ph
  %60 = load double, double* %arrayidx50.prol, align 8
  %61 = add nsw i64 %indvars.iv3149.ph, -1
  %arrayidx55.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %61
  %62 = load double, double* %arrayidx55.prol, align 8
  %sub56.prol = fsub double %60, %62
  %mul57.prol = fmul double %sub56.prol, 5.000000e-01
  %sub58.prol = fsub double %59, %mul57.prol
  store double %sub58.prol, double* %arrayidx46.prol, align 8
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv3149.ph, 1
  br label %for.body42

for.body42:                                       ; preds = %for.body42, %for.body42.preheader.new
  %indvars.iv3149 = phi i64 [ %indvars.iv.next32.prol, %for.body42.preheader.new ], [ %indvars.iv.next32.1, %for.body42 ]
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3450, i64 %indvars.iv3149
  %63 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %indvars.iv3149
  %64 = load double, double* %arrayidx50, align 8
  %65 = add nsw i64 %indvars.iv3149, -1
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %65
  %66 = load double, double* %arrayidx55, align 8
  %sub56 = fsub double %64, %66
  %mul57 = fmul double %sub56, 5.000000e-01
  %sub58 = fsub double %63, %mul57
  store double %sub58, double* %arrayidx46, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv3149, 1
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3450, i64 %indvars.iv.next32
  %67 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %indvars.iv.next32
  %68 = load double, double* %arrayidx50.1, align 8
  %arrayidx55.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3450, i64 %indvars.iv3149
  %69 = load double, double* %arrayidx55.1, align 8
  %sub56.1 = fsub double %68, %69
  %mul57.1 = fmul double %sub56.1, 5.000000e-01
  %sub58.1 = fsub double %67, %mul57.1
  store double %sub58.1, double* %arrayidx46.1, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv3149, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next32.1, 1200
  br i1 %exitcond55.1, label %for.end65, label %for.body42, !llvm.loop !16

for.end65:                                        ; preds = %for.body42
  %exitcond36 = icmp eq i64 %38, 1000
  br i1 %exitcond36, label %for.cond73.preheader.preheader, label %for.cond40.preheader

for.cond73.preheader.preheader:                   ; preds = %for.end65
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.cond73.preheader.preheader, %for.end109
  %indvars.iv3952 = phi i64 [ %70, %for.end109 ], [ 0, %for.cond73.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3952, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3952, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3952, i64 0
  %70 = add i64 %indvars.iv3952, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %70, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3952, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %70, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.body76.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3952, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !17, !noalias !20
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !17, !noalias !20
  %75 = or i64 %index, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3952, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !23
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !23
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3952, i64 %index
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !23
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !23
  %84 = fsub <2 x double> %wide.load17, %wide.load19
  %85 = fsub <2 x double> %wide.load18, %wide.load20
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %70, i64 %index
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !24
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !24
  %90 = fadd <2 x double> %84, %wide.load21
  %91 = fadd <2 x double> %85, %wide.load22
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3952, i64 %index
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !24
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !24
  %96 = fsub <2 x double> %90, %wide.load23
  %97 = fsub <2 x double> %91, %wide.load24
  %98 = fmul <2 x double> %96, <double 7.000000e-01, double 7.000000e-01>
  %99 = fmul <2 x double> %97, <double 7.000000e-01, double 7.000000e-01>
  %100 = fsub <2 x double> %wide.load, %98
  %101 = fsub <2 x double> %wide.load16, %99
  store <2 x double> %100, <2 x double>* %72, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %101, <2 x double>* %74, align 8, !alias.scope !17, !noalias !20
  %index.next = add i64 %index, 4
  %102 = icmp eq i64 %index.next, 1196
  br i1 %102, label %for.body76.preheader.loopexit, label %vector.body, !llvm.loop !25

for.body76.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body76.preheader

for.body76.preheader:                             ; preds = %for.body76.preheader.loopexit, %for.cond73.preheader
  %indvars.iv3751.ph = phi i64 [ 0, %for.cond73.preheader ], [ 1196, %for.body76.preheader.loopexit ]
  br label %for.body76

for.body76:                                       ; preds = %for.body76.preheader, %for.body76
  %indvars.iv3751 = phi i64 [ %indvars.iv.next38, %for.body76 ], [ %indvars.iv3751.ph, %for.body76.preheader ]
  %arrayidx80 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3952, i64 %indvars.iv3751
  %103 = load double, double* %arrayidx80, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv3751, 1
  %arrayidx84 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3952, i64 %indvars.iv.next38
  %104 = load double, double* %arrayidx84, align 8
  %arrayidx88 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3952, i64 %indvars.iv3751
  %105 = load double, double* %arrayidx88, align 8
  %sub89 = fsub double %104, %105
  %arrayidx94 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %70, i64 %indvars.iv3751
  %106 = load double, double* %arrayidx94, align 8
  %add95 = fadd double %sub89, %106
  %arrayidx99 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3952, i64 %indvars.iv3751
  %107 = load double, double* %arrayidx99, align 8
  %sub100 = fsub double %add95, %107
  %mul101 = fmul double %sub100, 7.000000e-01
  %sub102 = fsub double %103, %mul101
  store double %sub102, double* %arrayidx80, align 8
  %exitcond56 = icmp eq i64 %indvars.iv.next38, 1199
  br i1 %exitcond56, label %for.end109, label %for.body76, !llvm.loop !26

for.end109:                                       ; preds = %for.body76
  %exitcond42 = icmp eq i64 %70, 999
  br i1 %exitcond42, label %for.end112, label %for.cond73.preheader

for.end112:                                       ; preds = %for.end109
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4353, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 500
  br i1 %exitcond45, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.end112
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end, %entry
  %indvars.iv2938 = phi i64 [ 0, %entry ], [ %indvars.iv.next30, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv2938, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv2537 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next26, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv2537, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2938, i64 %indvars.iv2537
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2537, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2938, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond32, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.end36, %for.end12
  %indvars.iv2136 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next22, %for.end36 ]
  %13 = mul nuw nsw i64 %indvars.iv2136, 1000
  br label %for.body21

for.body21:                                       ; preds = %if.end28, %for.cond19.preheader
  %indvars.iv1735 = phi i64 [ 0, %for.cond19.preheader ], [ %indvars.iv.next18, %if.end28 ]
  %14 = add nuw nsw i64 %indvars.iv1735, %13
  %15 = trunc i64 %14 to i32
  %rem24 = srem i32 %15, 20
  %cmp25 = icmp eq i32 %rem24, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %for.body21
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28

if.end28:                                         ; preds = %for.body21, %if.then26
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2136, i64 %indvars.iv1735
  %18 = load double, double* %arrayidx32, align 8
  %call33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1735, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond20, label %for.end36, label %for.body21

for.end36:                                        ; preds = %if.end28
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2136, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond24, label %for.end39, label %for.cond19.preheader

for.end39:                                        ; preds = %for.end36
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %for.end62, %for.end39
  %indvars.iv1334 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next14, %for.end62 ]
  %21 = mul nuw nsw i64 %indvars.iv1334, 1000
  br label %for.body47

for.body47:                                       ; preds = %if.end54, %for.cond45.preheader
  %indvars.iv33 = phi i64 [ 0, %for.cond45.preheader ], [ %indvars.iv.next, %if.end54 ]
  %22 = add nuw nsw i64 %indvars.iv33, %21
  %23 = trunc i64 %22 to i32
  %rem50 = srem i32 %23, 20
  %cmp51 = icmp eq i32 %rem50, 0
  br i1 %cmp51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %for.body47
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %if.end54

if.end54:                                         ; preds = %for.body47, %if.then52
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1334, i64 %indvars.iv33
  %26 = load double, double* %arrayidx58, align 8
  %call59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.end62, label %for.body47

for.end62:                                        ; preds = %if.end54
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1334, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond16, label %for.end65, label %for.cond45.preheader

for.end65:                                        ; preds = %for.end62
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

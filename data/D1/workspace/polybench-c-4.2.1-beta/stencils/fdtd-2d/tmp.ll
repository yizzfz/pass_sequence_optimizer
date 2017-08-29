; ModuleID = 'B.ll'
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
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %6 to double*
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %5 to [1200 x double]*
  %18 = bitcast i8* %4 to [1200 x double]*
  %19 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %19, [1200 x double]* %18, [1200 x double]* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %16, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph8.preheader:
  br label %.lr.ph8

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv20 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv
  %13 = add nuw nsw i64 %indvars.iv, 2
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> %9, double %15, i32 1
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %8, i32 1
  %19 = fmul <2 x double> %18, %16
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.200000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %12, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv20, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge

.loopexit.us:                                     ; preds = %._crit_edge
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond23, label %.preheader3._crit_edge, label %.preheader.us

.lr.ph8:                                          ; preds = %.lr.ph8, %.lr.ph8.preheader
  %indvars.iv24 = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next25.4, %.lr.ph8 ]
  %30 = trunc i64 %indvars.iv24 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %6, i64 %indvars.iv24
  %33 = bitcast double* %32 to <2 x double>*
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %34 = trunc i64 %indvars.iv.next25 to i32
  %35 = sitofp i32 %34 to double
  %36 = insertelement <2 x double> undef, double %31, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  store <2 x double> %37, <2 x double>* %33, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %38 = trunc i64 %indvars.iv.next25.1 to i32
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next25.1
  %41 = bitcast double* %40 to <2 x double>*
  %indvars.iv.next25.2 = add nsw i64 %indvars.iv24, 3
  %42 = trunc i64 %indvars.iv.next25.2 to i32
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %39, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  store <2 x double> %45, <2 x double>* %41, align 8
  %indvars.iv.next25.3 = add nsw i64 %indvars.iv24, 4
  %46 = trunc i64 %indvars.iv.next25.3 to i32
  %47 = sitofp i32 %46 to double
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next25.3
  store double %47, double* %48, align 8
  %indvars.iv.next25.4 = add nsw i64 %indvars.iv24, 5
  %exitcond27.4 = icmp eq i64 %indvars.iv.next25.4, 500
  br i1 %exitcond27.4, label %.preheader.us.preheader, label %.lr.ph8

.preheader.us.preheader:                          ; preds = %.lr.ph8
  br label %.preheader.us

.preheader3._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader13.lr.ph:
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr.1 = ptrtoint double* %6 to i64
  %sunkaddr.2 = ptrtoint double* %6 to i64
  %sunkaddr.3 = ptrtoint double* %6 to i64
  %sunkaddr.4 = ptrtoint double* %6 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %.loopexit27, %.preheader13.lr.ph
  %indvars.iv74 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next75, %.loopexit27 ]
  %sunkaddr87 = shl nuw nsw i64 %indvars.iv74, 3
  %sunkaddr88 = add i64 %sunkaddr, %sunkaddr87
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i64*
  %sunkaddr87.1 = shl nuw nsw i64 %indvars.iv74, 3
  %sunkaddr88.1 = add i64 %sunkaddr.1, %sunkaddr87.1
  %sunkaddr89.1 = inttoptr i64 %sunkaddr88.1 to i64*
  %sunkaddr87.2 = shl nuw nsw i64 %indvars.iv74, 3
  %sunkaddr88.2 = add i64 %sunkaddr.2, %sunkaddr87.2
  %sunkaddr89.2 = inttoptr i64 %sunkaddr88.2 to i64*
  %sunkaddr87.3 = shl nuw nsw i64 %indvars.iv74, 3
  %sunkaddr88.3 = add i64 %sunkaddr.3, %sunkaddr87.3
  %sunkaddr89.3 = inttoptr i64 %sunkaddr88.3 to i64*
  %sunkaddr87.4 = shl nuw nsw i64 %indvars.iv74, 3
  %sunkaddr88.4 = add i64 %sunkaddr.4, %sunkaddr87.4
  %sunkaddr89.4 = inttoptr i64 %sunkaddr88.4 to i64*
  br label %49

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %.loopexit26.us
  %indvar = phi i64 [ %indvar.next, %.loopexit26.us ], [ 0, %.preheader9.us.preheader ]
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %.loopexit26.us ], [ 1, %.preheader9.us.preheader ]
  %7 = add nuw nsw i64 %indvar, 1
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %8 = add nuw nsw i64 %indvar, 2
  %scevgep154 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %scevgep156 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep158 = getelementptr [1200 x double], [1200 x double]* %5, i64 %8, i64 0
  %9 = add nsw i64 %indvars.iv62, -1
  %bound0160 = icmp ult double* %scevgep152, %scevgep158
  %bound1161 = icmp ult double* %scevgep156, %scevgep154
  %memcheck.conflict163 = and i1 %bound0160, %bound1161
  br i1 %memcheck.conflict163, label %._crit_edge55.preheader, label %vector.body147.preheader

vector.body147.preheader:                         ; preds = %.preheader9.us
  br label %vector.body147

._crit_edge55.preheader:                          ; preds = %.preheader9.us
  br label %._crit_edge55

vector.body147:                                   ; preds = %vector.body147, %vector.body147.preheader
  %index166 = phi i64 [ %index.next167, %vector.body147 ], [ 0, %vector.body147.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index166
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load174 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load175 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1, !noalias !4
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv62, i64 %index166
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load176 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !4
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load177 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !4
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %index166
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load178 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !4
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !4
  %22 = fsub <2 x double> %wide.load176, %wide.load178
  %23 = fsub <2 x double> %wide.load177, %wide.load179
  %24 = fmul <2 x double> %22, <double 5.000000e-01, double 5.000000e-01>
  %25 = fmul <2 x double> %23, <double 5.000000e-01, double 5.000000e-01>
  %26 = fsub <2 x double> %wide.load174, %24
  %27 = fsub <2 x double> %wide.load175, %25
  %28 = bitcast double* %10 to <2 x double>*
  store <2 x double> %26, <2 x double>* %28, align 8, !alias.scope !1, !noalias !4
  %29 = bitcast double* %12 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8, !alias.scope !1, !noalias !4
  %index.next167 = add nuw nsw i64 %index166, 4
  %30 = icmp eq i64 %index.next167, 1200
  br i1 %30, label %.loopexit26.us.loopexit181, label %vector.body147, !llvm.loop !6

._crit_edge55:                                    ; preds = %._crit_edge55, %._crit_edge55.preheader
  %indvars.iv60 = phi i64 [ 0, %._crit_edge55.preheader ], [ %indvars.iv.next61.1, %._crit_edge55 ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv60
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv60
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv60
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next61 = or i64 %indvars.iv60, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next61
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next61
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv.next61
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next61.1, 1200
  br i1 %exitcond83.1, label %.loopexit26.us.loopexit, label %._crit_edge55, !llvm.loop !9

.loopexit26.us.loopexit:                          ; preds = %._crit_edge55
  br label %.loopexit26.us

.loopexit26.us.loopexit181:                       ; preds = %vector.body147
  br label %.loopexit26.us

.loopexit26.us:                                   ; preds = %.loopexit26.us.loopexit181, %.loopexit26.us.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next63, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond84, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %.loopexit26.us
  br label %.preheader8.us

; <label>:49:                                     ; preds = %49, %.preheader13
  %indvars.iv = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next.4, %49 ]
  %50 = load i64, i64* %sunkaddr89, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = load i64, i64* %sunkaddr89.1, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %56 = load i64, i64* %sunkaddr89.2, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %59 = load i64, i64* %sunkaddr89.3, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %62 = load i64, i64* %sunkaddr89.4, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %.preheader9.us.preheader, label %49

.preheader9.us.preheader:                         ; preds = %49
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %.loopexit25.us, %.preheader8.us.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.loopexit25.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 1
  %65 = add nuw nsw i64 %indvars.iv68, 1
  %scevgep121 = getelementptr [1200 x double], [1200 x double]* %3, i64 %65, i64 0
  %scevgep123 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 0
  %scevgep125 = getelementptr [1200 x double], [1200 x double]* %5, i64 %65, i64 0
  %bound0127 = icmp ult double* %scevgep119, %scevgep125
  %bound1128 = icmp ult double* %scevgep123, %scevgep121
  %memcheck.conflict130 = and i1 %bound0127, %bound1128
  br i1 %memcheck.conflict130, label %scalar.ph116.preheader, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %.preheader8.us
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114, %vector.body114.preheader
  %index133 = phi i64 [ %index.next134, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %offset.idx = or i64 %index133, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10, !noalias !13
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10, !noalias !13
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load143 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !13
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load144 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !13
  %74 = add nsw i64 %offset.idx, -1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !13
  %79 = fsub <2 x double> %wide.load143, %wide.load145
  %80 = fsub <2 x double> %wide.load144, %wide.load146
  %81 = fmul <2 x double> %79, <double 5.000000e-01, double 5.000000e-01>
  %82 = fmul <2 x double> %80, <double 5.000000e-01, double 5.000000e-01>
  %83 = fsub <2 x double> %wide.load141, %81
  %84 = fsub <2 x double> %wide.load142, %82
  %85 = bitcast double* %66 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8, !alias.scope !10, !noalias !13
  %86 = bitcast double* %68 to <2 x double>*
  store <2 x double> %84, <2 x double>* %86, align 8, !alias.scope !10, !noalias !13
  %index.next134 = add nuw nsw i64 %index133, 4
  %87 = icmp eq i64 %index.next134, 1196
  br i1 %87, label %scalar.ph116.preheader.loopexit, label %vector.body114, !llvm.loop !15

scalar.ph116.preheader.loopexit:                  ; preds = %vector.body114
  br label %scalar.ph116.preheader

scalar.ph116.preheader:                           ; preds = %scalar.ph116.preheader.loopexit, %.preheader8.us
  %indvars.iv64.ph = phi i64 [ 1, %.preheader8.us ], [ 1197, %scalar.ph116.preheader.loopexit ]
  br i1 true, label %scalar.ph116.prol.preheader, label %scalar.ph116.prol.loopexit.unr-lcssa

scalar.ph116.prol.preheader:                      ; preds = %scalar.ph116.preheader
  br label %scalar.ph116.prol

scalar.ph116.prol:                                ; preds = %scalar.ph116.prol.preheader
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv64.ph
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv64.ph
  %91 = load double, double* %90, align 8
  %92 = add nsw i64 %indvars.iv64.ph, -1
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fsub double %91, %94
  %96 = fmul double %95, 5.000000e-01
  %97 = fsub double %89, %96
  store double %97, double* %88, align 8
  %indvars.iv.next65.prol = add nuw nsw i64 %indvars.iv64.ph, 1
  br label %scalar.ph116.prol.loopexit.unr-lcssa

scalar.ph116.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph116.prol, %scalar.ph116.preheader
  %indvars.iv64.unr.ph = phi i64 [ %indvars.iv.next65.prol, %scalar.ph116.prol ], [ %indvars.iv64.ph, %scalar.ph116.preheader ]
  br label %scalar.ph116.prol.loopexit

scalar.ph116.prol.loopexit:                       ; preds = %scalar.ph116.prol.loopexit.unr-lcssa
  br i1 false, label %.loopexit25.us, label %scalar.ph116.preheader.new

scalar.ph116.preheader.new:                       ; preds = %scalar.ph116.prol.loopexit
  br label %scalar.ph116

scalar.ph116:                                     ; preds = %scalar.ph116, %scalar.ph116.preheader.new
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr.ph, %scalar.ph116.preheader.new ], [ %indvars.iv.next65.1, %scalar.ph116 ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv64
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv64
  %101 = load double, double* %100, align 8
  %102 = add nsw i64 %indvars.iv64, -1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fsub double %101, %104
  %106 = fmul double %105, 5.000000e-01
  %107 = fsub double %99, %106
  store double %107, double* %98, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv.next65
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next65
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv64
  %113 = load double, double* %112, align 8
  %114 = fsub double %111, %113
  %115 = fmul double %114, 5.000000e-01
  %116 = fsub double %109, %115
  store double %116, double* %108, align 8
  %exitcond67.1 = icmp eq i64 %indvars.iv.next65, 1199
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  br i1 %exitcond67.1, label %.loopexit25.us.unr-lcssa, label %scalar.ph116, !llvm.loop !16

.loopexit25.us.unr-lcssa:                         ; preds = %scalar.ph116
  br label %.loopexit25.us

.loopexit25.us:                                   ; preds = %.loopexit25.us.unr-lcssa, %scalar.ph116.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond85, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %.loopexit25.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv72 = phi i64 [ %118, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv72, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv72, i64 1199
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 0
  %117 = add nuw nsw i64 %indvars.iv72, 1
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %3, i64 %117, i64 0
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 0
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %4, i64 %117, i64 1199
  %118 = add nuw nsw i64 %indvars.iv72, 1
  %bound0 = icmp ult double* %scevgep, %scevgep95
  %bound1 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0101 = icmp ult double* %scevgep, %scevgep99
  %bound1102 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx = or i1 %found.conflict, %found.conflict103
  br i1 %conflict.rdx, label %._crit_edge58.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv72, i64 %index
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !17, !noalias !20
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !17, !noalias !20
  %123 = or i64 %index, 1
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %123
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !23
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !23
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %index
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !23
  %130 = getelementptr double, double* %128, i64 2
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !23
  %132 = fsub <2 x double> %wide.load106, %wide.load108
  %133 = fsub <2 x double> %wide.load107, %wide.load109
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %118, i64 %index
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !24
  %136 = getelementptr double, double* %134, i64 2
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !24
  %138 = fadd <2 x double> %132, %wide.load110
  %139 = fadd <2 x double> %133, %wide.load111
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %index
  %141 = bitcast double* %140 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %141, align 8, !alias.scope !24
  %142 = getelementptr double, double* %140, i64 2
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !24
  %144 = fsub <2 x double> %138, %wide.load112
  %145 = fsub <2 x double> %139, %wide.load113
  %146 = fmul <2 x double> %144, <double 7.000000e-01, double 7.000000e-01>
  %147 = fmul <2 x double> %145, <double 7.000000e-01, double 7.000000e-01>
  %148 = fsub <2 x double> %wide.load, %146
  %149 = fsub <2 x double> %wide.load105, %147
  %150 = bitcast double* %119 to <2 x double>*
  store <2 x double> %148, <2 x double>* %150, align 8, !alias.scope !17, !noalias !20
  %151 = bitcast double* %121 to <2 x double>*
  store <2 x double> %149, <2 x double>* %151, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %152 = icmp eq i64 %index.next, 1196
  br i1 %152, label %._crit_edge58.preheader.loopexit, label %vector.body, !llvm.loop !25

._crit_edge58.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge58.preheader

._crit_edge58.preheader:                          ; preds = %._crit_edge58.preheader.loopexit, %.preheader.us
  %indvars.iv70.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge58.preheader.loopexit ]
  br label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge58, %._crit_edge58.preheader
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge58 ], [ %indvars.iv70.ph, %._crit_edge58.preheader ]
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv72, i64 %indvars.iv70
  %154 = load double, double* %153, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv.next71
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv70
  %158 = load double, double* %157, align 8
  %159 = fsub double %156, %158
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %118, i64 %indvars.iv70
  %161 = load double, double* %160, align 8
  %162 = fadd double %159, %161
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv70
  %164 = load double, double* %163, align 8
  %165 = fsub double %162, %164
  %166 = fmul double %165, 7.000000e-01
  %167 = fsub double %154, %166
  store double %167, double* %153, align 8
  %168 = icmp slt i64 %indvars.iv.next71, 1199
  br i1 %168, label %._crit_edge58, label %.loopexit.us, !llvm.loop !26

.loopexit.us:                                     ; preds = %._crit_edge58
  %exitcond180 = icmp eq i64 %118, 999
  br i1 %exitcond180, label %.loopexit27, label %.preheader.us

.loopexit27:                                      ; preds = %.loopexit.us
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next75, 500
  br i1 %exitcond86, label %._crit_edge, label %.preheader13

._crit_edge:                                      ; preds = %.loopexit27
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader13.lr.ph..preheader13.us_crit_edge:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %.loopexit31.us, %.preheader13.lr.ph..preheader13.us_crit_edge
  %indvars.iv73 = phi i64 [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ], [ %indvars.iv.next74, %.loopexit31.us ]
  %9 = mul nuw nsw i64 %indvars.iv73, 1000
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge51, %.preheader13.us
  %indvars.iv71 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next72, %._crit_edge51 ]
  %10 = add nuw nsw i64 %9, %indvars.iv71
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge51

; <label>:14:                                     ; preds = %._crit_edge52
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %14, %._crit_edge52
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv71
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next72, 1200
  br i1 %exitcond81, label %.loopexit31.us, label %._crit_edge52

.loopexit31.us:                                   ; preds = %._crit_edge51
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond82, label %._crit_edge, label %.preheader13.us

._crit_edge:                                      ; preds = %.loopexit31.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %.loopexit29.us, %._crit_edge
  %indvars.iv68 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next69, %.loopexit29.us ]
  %26 = mul nuw nsw i64 %indvars.iv68, 1000
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge54, %.preheader12.us
  %indvars.iv66 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next67, %._crit_edge54 ]
  %27 = add nuw nsw i64 %26, %indvars.iv66
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge54

; <label>:31:                                     ; preds = %._crit_edge55
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %31, %._crit_edge55
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv66
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #6
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next67, 1200
  br i1 %exitcond79, label %.loopexit29.us, label %._crit_edge55

.loopexit29.us:                                   ; preds = %._crit_edge54
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond80, label %._crit_edge53, label %.preheader12.us

._crit_edge53:                                    ; preds = %.loopexit29.us
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %._crit_edge53
  %indvars.iv64 = phi i64 [ 0, %._crit_edge53 ], [ %indvars.iv.next65, %.loopexit.us ]
  %41 = mul nuw nsw i64 %indvars.iv64, 1000
  br label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge57, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge57 ]
  %42 = add nuw nsw i64 %41, %indvars.iv
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %._crit_edge57

; <label>:46:                                     ; preds = %._crit_edge58
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %47) #5
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %46, %._crit_edge58
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %50) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge58

.loopexit.us:                                     ; preds = %._crit_edge57
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond78, label %._crit_edge56, label %.preheader.us

._crit_edge56:                                    ; preds = %.loopexit.us
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

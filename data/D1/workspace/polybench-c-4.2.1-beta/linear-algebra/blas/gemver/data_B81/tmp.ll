; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.loopexit._crit_edge

.loopexit:                                        ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %43, label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %29, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.loopexit._crit_edge
  %indvars.iv = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %35 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, <double 2.000000e+03, double 2.000000e+03>
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %._crit_edge

; <label>:43:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]*, double*, double* readonly, double*, double* readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep26 = getelementptr double, double* %4, i64 2000
  %scevgep28 = getelementptr double, double* %6, i64 2000
  br label %.preheader67

.preheader67:                                     ; preds = %middle.block, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %middle.block ]
  %12 = ptrtoint double* %3 to i64
  %13 = ptrtoint double* %5 to i64
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 0
  %scevgep23 = bitcast double* %scevgep to i8*
  %14 = add i64 %indvars.iv16, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %2, i64 %14, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %sunkaddr75 = shl nsw i64 %indvars.iv16, 3
  %sunkaddr76 = add i64 %12, %sunkaddr75
  %sunkaddr79 = shl nsw i64 %indvars.iv16, 3
  %sunkaddr80 = add i64 %13, %sunkaddr79
  %bc = inttoptr i64 %sunkaddr76 to i8*
  %bc30 = inttoptr i64 %sunkaddr76 to i8*
  %bound0 = icmp ult i8* %scevgep23, %bc30
  %bound1 = icmp ult i8* %bc, %scevgep2425
  %found.conflict = and i1 %bound0, %bound1
  %bound031 = icmp ult double* %scevgep, %scevgep26
  %bound132 = icmp ugt double* %scevgep24, %4
  %found.conflict33 = and i1 %bound031, %bound132
  %conflict.rdx = or i1 %found.conflict, %found.conflict33
  %bc34 = inttoptr i64 %sunkaddr80 to i8*
  %bc35 = inttoptr i64 %sunkaddr80 to i8*
  %bound036 = icmp ult i8* %scevgep23, %bc35
  %bound137 = icmp ult i8* %bc34, %scevgep2425
  %found.conflict38 = and i1 %bound036, %bound137
  %conflict.rdx39 = or i1 %conflict.rdx, %found.conflict38
  %bound040 = icmp ult double* %scevgep, %scevgep28
  %bound141 = icmp ugt double* %scevgep24, %6
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx43 = or i1 %conflict.rdx39, %found.conflict42
  br i1 %conflict.rdx43, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67
  br label %vector.body

._crit_edge.preheader:                            ; preds = %.preheader67
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %15 = inttoptr i64 %sunkaddr76 to double*
  %16 = inttoptr i64 %sunkaddr80 to double*
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1, !noalias !4
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1, !noalias !4
  %21 = load double, double* %15, align 8, !alias.scope !9
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = insertelement <2 x double> undef, double %21, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds double, double* %4, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !10
  %30 = fmul <2 x double> %23, %wide.load46
  %31 = fmul <2 x double> %25, %wide.load47
  %32 = fadd <2 x double> %wide.load, %30
  %33 = fadd <2 x double> %wide.load45, %31
  %34 = load double, double* %16, align 8, !alias.scope !11
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = insertelement <2 x double> undef, double %34, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = getelementptr inbounds double, double* %6, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !12
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !12
  %43 = fmul <2 x double> %36, %wide.load48
  %44 = fmul <2 x double> %38, %wide.load49
  %45 = fadd <2 x double> %32, %43
  %46 = fadd <2 x double> %33, %44
  %47 = bitcast double* %17 to <2 x double>*
  store <2 x double> %45, <2 x double>* %47, align 8, !alias.scope !1, !noalias !4
  %48 = bitcast double* %19 to <2 x double>*
  store <2 x double> %46, <2 x double>* %48, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 4
  %49 = icmp eq i64 %index.next, 2000
  br i1 %49, label %middle.block.loopexit86, label %vector.body, !llvm.loop !13

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next14.1, %._crit_edge ]
  %50 = inttoptr i64 %sunkaddr76 to double*
  %51 = inttoptr i64 %sunkaddr80 to double*
  %52 = inttoptr i64 %sunkaddr76 to double*
  %53 = inttoptr i64 %sunkaddr80 to double*
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %55 = load double, double* %54, align 8
  %56 = load double, double* %52, align 8
  %57 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %55, %59
  %61 = load double, double* %53, align 8
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %60, %64
  store double %65, double* %54, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %67 = load double, double* %66, align 8
  %68 = load double, double* %50, align 8
  %69 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %67, %71
  %73 = load double, double* %51, align 8
  %74 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %72, %76
  store double %77, double* %66, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %middle.block.loopexit, label %._crit_edge, !llvm.loop !16

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit86:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit86, %middle.block.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %..preheader65_crit_edge, label %.preheader67

..preheader65_crit_edge:                          ; preds = %middle.block
  br label %.preheader65

.preheader65:                                     ; preds = %94, %..preheader65_crit_edge
  %indvars.iv10 = phi i64 [ 0, %..preheader65_crit_edge ], [ %indvars.iv.next11, %94 ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %.preheader65
  %indvars.iv7 = phi i64 [ 0, %.preheader65 ], [ %indvars.iv.next8.1, %._crit_edge19 ]
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr67 = mul i64 %indvars.iv10, 8
  %sunkaddr68 = add i64 %sunkaddr, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %78 = load double, double* %sunkaddr69, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %1
  %82 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %78, %84
  store double %85, double* %sunkaddr69, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %sunkaddr70 = ptrtoint double* %8 to i64
  %sunkaddr71 = mul i64 %indvars.iv10, 8
  %sunkaddr72 = add i64 %sunkaddr70, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  %86 = load double, double* %sunkaddr73, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %1
  %90 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fadd double %86, %92
  store double %93, double* %sunkaddr73, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %94, label %._crit_edge19

; <label>:94:                                     ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader64.preheader, label %.preheader65

.preheader64.preheader:                           ; preds = %94
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64, %.preheader64.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader64.preheader ], [ %indvars.iv.next5.4, %.preheader64 ]
  %95 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %98 = load double, double* %97, align 8
  %99 = fadd double %96, %98
  store double %99, double* %95, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %100 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %103 = load double, double* %102, align 8
  %104 = fadd double %101, %103
  store double %104, double* %100, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %105 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %108 = load double, double* %107, align 8
  %109 = fadd double %106, %108
  store double %109, double* %105, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %110 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  store double %114, double* %110, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %115 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  store double %119, double* %115, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader64..preheader_crit_edge, label %.preheader64

.preheader64..preheader_crit_edge:                ; preds = %.preheader64
  br label %.preheader

.preheader:                                       ; preds = %136, %.preheader64..preheader_crit_edge
  %indvars.iv1 = phi i64 [ 0, %.preheader64..preheader_crit_edge ], [ %indvars.iv.next2, %136 ]
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge21 ]
  %sunkaddr74 = ptrtoint double* %7 to i64
  %sunkaddr77 = mul i64 %indvars.iv1, 8
  %sunkaddr78 = add i64 %sunkaddr74, %sunkaddr77
  %sunkaddr81 = inttoptr i64 %sunkaddr78 to double*
  %120 = load double, double* %sunkaddr81, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, %0
  %124 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %120, %126
  store double %127, double* %sunkaddr81, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %sunkaddr82 = ptrtoint double* %7 to i64
  %sunkaddr83 = mul i64 %indvars.iv1, 8
  %sunkaddr84 = add i64 %sunkaddr82, %sunkaddr83
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to double*
  %128 = load double, double* %sunkaddr85, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %0
  %132 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %133 = load double, double* %132, align 8
  %134 = fmul double %131, %133
  %135 = fadd double %128, %134
  store double %135, double* %sunkaddr85, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %136, label %._crit_edge21

; <label>:136:                                    ; preds = %._crit_edge21
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %137, label %.preheader

; <label>:137:                                    ; preds = %136
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}

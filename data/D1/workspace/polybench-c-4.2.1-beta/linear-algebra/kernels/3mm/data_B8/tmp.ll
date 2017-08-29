; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [800 x [900 x double]]*, align 8
  %11 = alloca [800 x [1000 x double]]*, align 8
  %12 = alloca [1000 x [900 x double]]*, align 8
  %13 = alloca [900 x [1100 x double]]*, align 8
  %14 = alloca [900 x [1200 x double]]*, align 8
  %15 = alloca [1200 x [1100 x double]]*, align 8
  %16 = alloca [800 x [1100 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 800, i32* %5, align 4
  store i32 900, i32* %6, align 4
  store i32 1000, i32* %7, align 4
  store i32 1100, i32* %8, align 4
  store i32 1200, i32* %9, align 4
  %17 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %18 = bitcast [800 x [900 x double]]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %20 = bitcast [800 x [1000 x double]]** %11 to i8**
  store i8* %19, i8** %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %22 = bitcast [1000 x [900 x double]]** %12 to i8**
  store i8* %21, i8** %22, align 8
  %23 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %24 = bitcast [900 x [1100 x double]]** %13 to i8**
  store i8* %23, i8** %24, align 8
  %25 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %26 = bitcast [900 x [1200 x double]]** %14 to i8**
  store i8* %25, i8** %26, align 8
  %27 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %28 = bitcast [1200 x [1100 x double]]** %15 to i8**
  store i8* %27, i8** %28, align 8
  %29 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %30 = bitcast [800 x [1100 x double]]** %16 to i8**
  store i8* %29, i8** %30, align 8
  %31 = ptrtoint i8* %19 to i64
  %32 = inttoptr i64 %31 to [1000 x double]*
  %33 = ptrtoint i8* %21 to i64
  %34 = inttoptr i64 %33 to [900 x double]*
  %35 = ptrtoint i8* %25 to i64
  %36 = inttoptr i64 %35 to [1200 x double]*
  %37 = ptrtoint i8* %27 to i64
  %38 = inttoptr i64 %37 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %32, [900 x double]* %34, [1200 x double]* %36, [1100 x double]* %38)
  tail call void (...) @polybench_timer_start() #4
  %39 = ptrtoint i8* %17 to i64
  %40 = inttoptr i64 %39 to [900 x double]*
  %41 = ptrtoint i8* %23 to i64
  %42 = inttoptr i64 %41 to [1100 x double]*
  %43 = ptrtoint i8* %29 to i64
  %44 = inttoptr i64 %43 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %40, [1000 x double]* %32, [900 x double]* %34, [1100 x double]* %42, [1200 x double]* %36, [1100 x double]* %38, [1100 x double]* %44)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %45 = icmp sgt i32 %0, 42
  br i1 %45, label %46, label %._crit_edge

; <label>:46:                                     ; preds = %2
  %47 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %47, align 1
  %48 = icmp eq i8 %strcmpload, 0
  br i1 %48, label %49, label %._crit_edge

; <label>:49:                                     ; preds = %46
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %44)
  br label %._crit_edge

._crit_edge:                                      ; preds = %46, %2, %49
  tail call void @free(i8* %17) #4
  tail call void @free(i8* %19) #4
  tail call void @free(i8* %21) #4
  tail call void @free(i8* %23) #4
  tail call void @free(i8* %25) #4
  tail call void @free(i8* %27) #4
  tail call void @free(i8* %29) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca [1000 x double]*, align 8
  %16 = alloca [900 x double]*, align 8
  %17 = alloca [1200 x double]*, align 8
  %18 = alloca [1100 x double]*, align 8
  %19 = alloca i32, align 4
  store i32 %0, i32* %10, align 4
  store i32 %1, i32* %11, align 4
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store [1000 x double]* %5, [1000 x double]** %15, align 8
  store [900 x double]* %6, [900 x double]** %16, align 8
  store [1200 x double]* %7, [1200 x double]** %17, align 8
  store [1100 x double]* %8, [1100 x double]** %18, align 8
  store i32 0, i32* %19, align 4
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %.preheader13.lr.ph, label %.preheader12

.preheader13.lr.ph:                               ; preds = %9
  %21 = icmp sgt i32 %2, 0
  %22 = mul nsw i32 %0, 5
  %23 = sitofp i32 %22 to double
  br i1 %21, label %.preheader13.us.preheader, label %..preheader12_crit_edge.loopexit56

.preheader13.us.preheader:                        ; preds = %.preheader13.lr.ph
  %24 = sext i32 %0 to i64
  %wide.trip.count80 = zext i32 %2 to i64
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge45.us, %.preheader13.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next83, %._crit_edge45.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader13.us
  %indvars.iv78 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next79, %._crit_edge ]
  %25 = mul nsw i64 %indvars.iv82, %indvars.iv78
  %26 = add nsw i64 %25, 1
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %0
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %23
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv78
  store double %30, double* %31, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge45.us, label %._crit_edge

._crit_edge45.us:                                 ; preds = %._crit_edge
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %32 = icmp slt i64 %indvars.iv.next83, %24
  br i1 %32, label %.preheader13.us, label %..preheader12_crit_edge.loopexit

..preheader12_crit_edge.loopexit:                 ; preds = %._crit_edge45.us
  %33 = trunc i64 %indvars.iv.next83 to i32
  br label %..preheader12_crit_edge

..preheader12_crit_edge.loopexit56:               ; preds = %.preheader13.lr.ph
  %34 = icmp sgt i32 %0, 1
  %smax85 = select i1 %34, i32 %0, i32 1
  br label %..preheader12_crit_edge

..preheader12_crit_edge:                          ; preds = %..preheader12_crit_edge.loopexit56, %..preheader12_crit_edge.loopexit
  %.lcssa52 = phi i32 [ %33, %..preheader12_crit_edge.loopexit ], [ %smax85, %..preheader12_crit_edge.loopexit56 ]
  store i32 %.lcssa52, i32* %19, align 4
  br label %.preheader12

.preheader12:                                     ; preds = %9, %..preheader12_crit_edge
  store i32 0, i32* %19, align 4
  %35 = icmp sgt i32 %2, 0
  br i1 %35, label %.preheader11.lr.ph, label %.preheader10

.preheader11.lr.ph:                               ; preds = %.preheader12
  %36 = icmp sgt i32 %1, 0
  br i1 %36, label %.preheader11.us.preheader, label %..preheader10_crit_edge.loopexit55

.preheader11.us.preheader:                        ; preds = %.preheader11.lr.ph
  %37 = sext i32 %2 to i64
  %38 = mul nsw i32 %1, 5
  %39 = sitofp i32 %38 to double
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge35.us, %.preheader11.us.preheader
  %indvars.iv74 = phi i64 [ 0, %.preheader11.us.preheader ], [ %indvars.iv.next75, %._crit_edge35.us ]
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %._crit_edge87, %.preheader11.us
  %indvars.iv72 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next73, %._crit_edge87 ]
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %40 = mul nsw i64 %indvars.iv74, %indvars.iv.next73
  %41 = add nsw i64 %40, 2
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %1
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %39
  %46 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv72
  store double %45, double* %46, align 8
  %exitcond = icmp eq i64 %indvars.iv.next73, %wide.trip.count
  br i1 %exitcond, label %._crit_edge35.us, label %._crit_edge87

._crit_edge35.us:                                 ; preds = %._crit_edge87
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, 1
  %47 = icmp slt i64 %indvars.iv.next75, %37
  br i1 %47, label %.preheader11.us, label %..preheader10_crit_edge.loopexit

..preheader10_crit_edge.loopexit:                 ; preds = %._crit_edge35.us
  %48 = trunc i64 %indvars.iv.next75 to i32
  br label %..preheader10_crit_edge

..preheader10_crit_edge.loopexit55:               ; preds = %.preheader11.lr.ph
  %49 = icmp sgt i32 %2, 1
  %smax77 = select i1 %49, i32 %2, i32 1
  br label %..preheader10_crit_edge

..preheader10_crit_edge:                          ; preds = %..preheader10_crit_edge.loopexit55, %..preheader10_crit_edge.loopexit
  %.lcssa42 = phi i32 [ %48, %..preheader10_crit_edge.loopexit ], [ %smax77, %..preheader10_crit_edge.loopexit55 ]
  store i32 %.lcssa42, i32* %19, align 4
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader12, %..preheader10_crit_edge
  store i32 0, i32* %19, align 4
  %50 = icmp sgt i32 %1, 0
  br i1 %50, label %.preheader9.lr.ph, label %.preheader8

.preheader9.lr.ph:                                ; preds = %.preheader10
  %51 = icmp sgt i32 %4, 0
  %52 = mul nsw i32 %3, 5
  %53 = sitofp i32 %52 to double
  br i1 %51, label %.preheader9.us.preheader, label %..preheader8_crit_edge.loopexit54

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %54 = sext i32 %4 to i64
  %55 = sext i32 %1 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge25.us, %.preheader9.us.preheader
  %indvars.iv68 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next69, %._crit_edge25.us ]
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88, %.preheader9.us
  %indvars.iv66 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next67, %._crit_edge88 ]
  %56 = add nuw nsw i64 %indvars.iv66, 3
  %57 = mul nsw i64 %indvars.iv68, %56
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, %3
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, %53
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv68, i64 %indvars.iv66
  store double %61, double* %62, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %63 = icmp slt i64 %indvars.iv.next67, %54
  br i1 %63, label %._crit_edge88, label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge88
  %indvars.iv.next69 = add nsw i64 %indvars.iv68, 1
  %64 = icmp slt i64 %indvars.iv.next69, %55
  br i1 %64, label %.preheader9.us, label %..preheader8_crit_edge.loopexit

..preheader8_crit_edge.loopexit:                  ; preds = %._crit_edge25.us
  %65 = trunc i64 %indvars.iv.next69 to i32
  br label %..preheader8_crit_edge

..preheader8_crit_edge.loopexit54:                ; preds = %.preheader9.lr.ph
  %66 = icmp sgt i32 %1, 1
  %smax71 = select i1 %66, i32 %1, i32 1
  br label %..preheader8_crit_edge

..preheader8_crit_edge:                           ; preds = %..preheader8_crit_edge.loopexit54, %..preheader8_crit_edge.loopexit
  %.lcssa32 = phi i32 [ %65, %..preheader8_crit_edge.loopexit ], [ %smax71, %..preheader8_crit_edge.loopexit54 ]
  store i32 %.lcssa32, i32* %19, align 4
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader10, %..preheader8_crit_edge
  store i32 0, i32* %19, align 4
  %67 = icmp sgt i32 %4, 0
  br i1 %67, label %.preheader.lr.ph, label %.preheader8._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader8
  %68 = icmp sgt i32 %3, 0
  %69 = mul nsw i32 %2, 5
  %70 = sitofp i32 %69 to double
  br i1 %68, label %.preheader.us.preheader, label %._crit_edge19.loopexit53

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %71 = sext i32 %3 to i64
  %72 = sext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next65, %._crit_edge.us ]
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge89 ]
  %73 = add nuw nsw i64 %indvars.iv, 2
  %74 = mul nsw i64 %indvars.iv64, %73
  %75 = add nsw i64 %74, 2
  %76 = trunc i64 %75 to i32
  %77 = srem i32 %76, %2
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %78, %70
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv64, i64 %indvars.iv
  store double %79, double* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = icmp slt i64 %indvars.iv.next, %71
  br i1 %81, label %._crit_edge89, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge89
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %82 = icmp slt i64 %indvars.iv.next65, %72
  br i1 %82, label %.preheader.us, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  %83 = trunc i64 %indvars.iv.next65 to i32
  br label %._crit_edge19

._crit_edge19.loopexit53:                         ; preds = %.preheader.lr.ph
  %84 = icmp sgt i32 %4, 1
  %smax = select i1 %84, i32 %4, i32 1
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit53, %._crit_edge19.loopexit
  %.lcssa22 = phi i32 [ %83, %._crit_edge19.loopexit ], [ %smax, %._crit_edge19.loopexit53 ]
  store i32 %.lcssa22, i32* %19, align 4
  br label %.preheader8._crit_edge

.preheader8._crit_edge:                           ; preds = %.preheader8, %._crit_edge19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) unnamed_addr #2 {
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca [900 x double]*, align 8
  %19 = alloca [1000 x double]*, align 8
  %20 = alloca [900 x double]*, align 8
  %21 = alloca [1100 x double]*, align 8
  %22 = alloca [1200 x double]*, align 8
  %23 = alloca [1100 x double]*, align 8
  %24 = alloca [1100 x double]*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  store i32 %0, i32* %13, align 4
  store i32 %1, i32* %14, align 4
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store [900 x double]* %5, [900 x double]** %18, align 8
  store [1000 x double]* %6, [1000 x double]** %19, align 8
  store [900 x double]* %7, [900 x double]** %20, align 8
  store [1100 x double]* %8, [1100 x double]** %21, align 8
  store [1200 x double]* %9, [1200 x double]** %22, align 8
  store [1100 x double]* %10, [1100 x double]** %23, align 8
  store [1100 x double]* %11, [1100 x double]** %24, align 8
  store i32 0, i32* %25, align 4
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %.preheader12.lr.ph, label %.preheader11

.preheader12.lr.ph:                               ; preds = %12
  %28 = icmp sgt i32 %1, 0
  %29 = icmp sgt i32 %2, 0
  br i1 %28, label %.preheader12.us.preheader, label %..preheader11_crit_edge.loopexit103

.preheader12.us.preheader:                        ; preds = %.preheader12.lr.ph
  %30 = add i32 %1, -1
  %31 = zext i32 %30 to i64
  %32 = shl nuw nsw i64 %31, 3
  %33 = add nuw nsw i64 %32, 8
  %34 = sext i32 %0 to i64
  %xtraiter162 = and i32 %2, 1
  %lcmp.mod163 = icmp eq i32 %xtraiter162, 0
  %35 = icmp eq i32 %2, 1
  %wide.trip.count166 = zext i32 %1 to i64
  %wide.trip.count158.1 = zext i32 %2 to i64
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge76.us..preheader12.us_crit_edge, %.preheader12.us.preheader
  %indvars.iv170 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next171, %._crit_edge76.us..preheader12.us_crit_edge ]
  %indvar152 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvar.next153, %._crit_edge76.us..preheader12.us_crit_edge ]
  br i1 %29, label %.lr.ph70.us.us.preheader, label %._crit_edge76.us.loopexit102

.lr.ph70.us.us.preheader:                         ; preds = %.preheader12.us
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv170, i64 0
  br label %.lr.ph70.us.us

._crit_edge76.us.loopexit102:                     ; preds = %.preheader12.us
  %scevgep154 = getelementptr [900 x double], [900 x double]* %5, i64 %indvar152, i64 0
  %scevgep154155 = bitcast double* %scevgep154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154155, i8 0, i64 %33, i32 8, i1 false)
  br label %._crit_edge76.us

._crit_edge76.us.loopexit:                        ; preds = %._crit_edge71.us.us
  br label %._crit_edge76.us

._crit_edge76.us:                                 ; preds = %._crit_edge76.us.loopexit, %._crit_edge76.us.loopexit102
  %.lcssa7380.lcssa.us = phi i32 [ 0, %._crit_edge76.us.loopexit102 ], [ %2, %._crit_edge76.us.loopexit ]
  %indvars.iv.next171 = add nsw i64 %indvars.iv170, 1
  %37 = icmp slt i64 %indvars.iv.next171, %34
  br i1 %37, label %._crit_edge76.us..preheader12.us_crit_edge, label %..preheader11_crit_edge.loopexit

._crit_edge76.us..preheader12.us_crit_edge:       ; preds = %._crit_edge76.us
  %indvar.next153 = add nuw nsw i64 %indvar152, 1
  br label %.preheader12.us

.lr.ph70.us.us:                                   ; preds = %._crit_edge71.us.us, %.lr.ph70.us.us.preheader
  %indvars.iv164 = phi i64 [ 0, %.lr.ph70.us.us.preheader ], [ %indvars.iv.next165, %._crit_edge71.us.us ]
  %38 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv170, i64 %indvars.iv164
  store double 0.000000e+00, double* %38, align 8
  br i1 %lcmp.mod163, label %.prol.loopexit161, label %.prol.preheader160

.prol.preheader160:                               ; preds = %.lr.ph70.us.us
  %39 = load double, double* %36, align 8
  %40 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv164
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %42, 0.000000e+00
  store double %43, double* %38, align 8
  br label %.prol.loopexit161

.prol.loopexit161:                                ; preds = %.lr.ph70.us.us, %.prol.preheader160
  %44 = phi double [ %43, %.prol.preheader160 ], [ 0.000000e+00, %.lr.ph70.us.us ]
  %indvars.iv156.unr.ph = phi i64 [ 1, %.prol.preheader160 ], [ 0, %.lr.ph70.us.us ]
  br i1 %35, label %._crit_edge71.us.us, label %.lr.ph70.us.us.new.preheader

.lr.ph70.us.us.new.preheader:                     ; preds = %.prol.loopexit161
  br label %.lr.ph70.us.us.new

._crit_edge71.us.us.loopexit:                     ; preds = %.lr.ph70.us.us.new
  br label %._crit_edge71.us.us

._crit_edge71.us.us:                              ; preds = %._crit_edge71.us.us.loopexit, %.prol.loopexit161
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %._crit_edge76.us.loopexit, label %.lr.ph70.us.us

.lr.ph70.us.us.new:                               ; preds = %.lr.ph70.us.us.new.preheader, %.lr.ph70.us.us.new
  %45 = phi double [ %57, %.lr.ph70.us.us.new ], [ %44, %.lr.ph70.us.us.new.preheader ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157.1, %.lr.ph70.us.us.new ], [ %indvars.iv156.unr.ph, %.lr.ph70.us.us.new.preheader ]
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv170, i64 %indvars.iv156
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv156, i64 %indvars.iv164
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %50, %45
  store double %51, double* %38, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv170, i64 %indvars.iv.next157
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next157, i64 %indvars.iv164
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %56, %51
  store double %57, double* %38, align 8
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %exitcond159.1 = icmp eq i64 %indvars.iv.next157.1, %wide.trip.count158.1
  br i1 %exitcond159.1, label %._crit_edge71.us.us.loopexit, label %.lr.ph70.us.us.new

..preheader11_crit_edge.loopexit:                 ; preds = %._crit_edge76.us
  %58 = trunc i64 %indvars.iv.next171 to i32
  br label %..preheader11_crit_edge

..preheader11_crit_edge.loopexit103:              ; preds = %.preheader12.lr.ph
  %59 = icmp sgt i32 %0, 1
  %smax174 = select i1 %59, i32 %0, i32 1
  br label %..preheader11_crit_edge

..preheader11_crit_edge:                          ; preds = %..preheader11_crit_edge.loopexit103, %..preheader11_crit_edge.loopexit
  %.lcssa7380.lcssa87.lcssa = phi i32 [ %.lcssa7380.lcssa.us, %..preheader11_crit_edge.loopexit ], [ undef, %..preheader11_crit_edge.loopexit103 ]
  %.lcssa82 = phi i32 [ %58, %..preheader11_crit_edge.loopexit ], [ %smax174, %..preheader11_crit_edge.loopexit103 ]
  store i32 %.lcssa82, i32* %25, align 4
  store i32 %.lcssa7380.lcssa87.lcssa, i32* %26, align 4
  br label %.preheader11

.preheader11:                                     ; preds = %12, %..preheader11_crit_edge
  %.promoted55 = phi i32 [ undef, %12 ], [ %.lcssa7380.lcssa87.lcssa, %..preheader11_crit_edge ]
  store i32 0, i32* %25, align 4
  %60 = icmp sgt i32 %1, 0
  br i1 %60, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %.preheader11
  %61 = icmp sgt i32 %3, 0
  %62 = icmp sgt i32 %4, 0
  br i1 %61, label %.preheader10.us.preheader, label %..preheader9_crit_edge.loopexit101

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %63 = add i32 %3, -1
  %64 = zext i32 %63 to i64
  %65 = shl nuw nsw i64 %64, 3
  %66 = add nuw nsw i64 %65, 8
  %67 = sext i32 %1 to i64
  %xtraiter135 = and i32 %4, 1
  %lcmp.mod136 = icmp eq i32 %xtraiter135, 0
  %68 = icmp eq i32 %4, 1
  %wide.trip.count139 = zext i32 %3 to i64
  %wide.trip.count131.1 = zext i32 %4 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge46.us..preheader10.us_crit_edge, %.preheader10.us.preheader
  %indvars.iv143 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next144, %._crit_edge46.us..preheader10.us_crit_edge ]
  %indvar125 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvar.next126, %._crit_edge46.us..preheader10.us_crit_edge ]
  br i1 %62, label %.lr.ph40.us.us.preheader, label %._crit_edge46.us.loopexit100

.lr.ph40.us.us.preheader:                         ; preds = %.preheader10.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 0
  br label %.lr.ph40.us.us

._crit_edge46.us.loopexit100:                     ; preds = %.preheader10.us
  %scevgep127 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvar125, i64 0
  %scevgep127128 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep127128, i8 0, i64 %66, i32 8, i1 false)
  br label %._crit_edge46.us

._crit_edge46.us.loopexit:                        ; preds = %._crit_edge41.us.us
  br label %._crit_edge46.us

._crit_edge46.us:                                 ; preds = %._crit_edge46.us.loopexit, %._crit_edge46.us.loopexit100
  %.lcssa4350.lcssa.us = phi i32 [ 0, %._crit_edge46.us.loopexit100 ], [ %4, %._crit_edge46.us.loopexit ]
  %indvars.iv.next144 = add nsw i64 %indvars.iv143, 1
  %70 = icmp slt i64 %indvars.iv.next144, %67
  br i1 %70, label %._crit_edge46.us..preheader10.us_crit_edge, label %..preheader9_crit_edge.loopexit

._crit_edge46.us..preheader10.us_crit_edge:       ; preds = %._crit_edge46.us
  %indvar.next126 = add nuw nsw i64 %indvar125, 1
  br label %.preheader10.us

.lr.ph40.us.us:                                   ; preds = %._crit_edge41.us.us, %.lr.ph40.us.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph40.us.us.preheader ], [ %indvars.iv.next138, %._crit_edge41.us.us ]
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv143, i64 %indvars.iv137
  store double 0.000000e+00, double* %71, align 8
  br i1 %lcmp.mod136, label %.prol.loopexit134, label %.prol.preheader133

.prol.preheader133:                               ; preds = %.lr.ph40.us.us
  %72 = load double, double* %69, align 8
  %73 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv137
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %75, 0.000000e+00
  store double %76, double* %71, align 8
  br label %.prol.loopexit134

.prol.loopexit134:                                ; preds = %.lr.ph40.us.us, %.prol.preheader133
  %77 = phi double [ %76, %.prol.preheader133 ], [ 0.000000e+00, %.lr.ph40.us.us ]
  %indvars.iv129.unr.ph = phi i64 [ 1, %.prol.preheader133 ], [ 0, %.lr.ph40.us.us ]
  br i1 %68, label %._crit_edge41.us.us, label %.lr.ph40.us.us.new.preheader

.lr.ph40.us.us.new.preheader:                     ; preds = %.prol.loopexit134
  br label %.lr.ph40.us.us.new

._crit_edge41.us.us.loopexit:                     ; preds = %.lr.ph40.us.us.new
  br label %._crit_edge41.us.us

._crit_edge41.us.us:                              ; preds = %._crit_edge41.us.us.loopexit, %.prol.loopexit134
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %._crit_edge46.us.loopexit, label %.lr.ph40.us.us

.lr.ph40.us.us.new:                               ; preds = %.lr.ph40.us.us.new.preheader, %.lr.ph40.us.us.new
  %78 = phi double [ %90, %.lr.ph40.us.us.new ], [ %77, %.lr.ph40.us.us.new.preheader ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130.1, %.lr.ph40.us.us.new ], [ %indvars.iv129.unr.ph, %.lr.ph40.us.us.new.preheader ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 %indvars.iv129
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv137
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %83, %78
  store double %84, double* %71, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 %indvars.iv.next130
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next130, i64 %indvars.iv137
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %89, %84
  store double %90, double* %71, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %exitcond132.1 = icmp eq i64 %indvars.iv.next130.1, %wide.trip.count131.1
  br i1 %exitcond132.1, label %._crit_edge41.us.us.loopexit, label %.lr.ph40.us.us.new

..preheader9_crit_edge.loopexit:                  ; preds = %._crit_edge46.us
  %91 = trunc i64 %indvars.iv.next144 to i32
  br label %..preheader9_crit_edge

..preheader9_crit_edge.loopexit101:               ; preds = %.preheader10.lr.ph
  %92 = icmp sgt i32 %1, 1
  %smax147 = select i1 %92, i32 %1, i32 1
  br label %..preheader9_crit_edge

..preheader9_crit_edge:                           ; preds = %..preheader9_crit_edge.loopexit101, %..preheader9_crit_edge.loopexit
  %.lcssa4350.lcssa57.lcssa = phi i32 [ %.lcssa4350.lcssa.us, %..preheader9_crit_edge.loopexit ], [ %.promoted55, %..preheader9_crit_edge.loopexit101 ]
  %.lcssa52 = phi i32 [ %91, %..preheader9_crit_edge.loopexit ], [ %smax147, %..preheader9_crit_edge.loopexit101 ]
  store i32 %.lcssa52, i32* %25, align 4
  store i32 %.lcssa4350.lcssa57.lcssa, i32* %26, align 4
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader11, %..preheader9_crit_edge
  %.promoted25 = phi i32 [ %.promoted55, %.preheader11 ], [ %.lcssa4350.lcssa57.lcssa, %..preheader9_crit_edge ]
  store i32 0, i32* %25, align 4
  br i1 %27, label %.preheader.lr.ph, label %.preheader9._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader9
  %93 = icmp sgt i32 %3, 0
  br i1 %93, label %.preheader.us.preheader, label %._crit_edge21.loopexit99

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %94 = add i32 %3, -1
  %95 = zext i32 %94 to i64
  %96 = shl nuw nsw i64 %95, 3
  %97 = add nuw nsw i64 %96, 8
  %98 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %99 = icmp eq i32 %1, 1
  %wide.trip.count115 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge16.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv118 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next119, %._crit_edge16.us..preheader.us_crit_edge ]
  %indvar = phi i64 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge16.us..preheader.us_crit_edge ]
  br i1 %60, label %.lr.ph.us.us.preheader, label %._crit_edge16.us.loopexit98

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %100 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit98:                      ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvar, i64 0
  %scevgep112 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112, i8 0, i64 %97, i32 8, i1 false)
  br label %._crit_edge16.us

._crit_edge16.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %._crit_edge16.us.loopexit98
  %.lcssa20.lcssa.us = phi i32 [ 0, %._crit_edge16.us.loopexit98 ], [ %1, %._crit_edge16.us.loopexit ]
  %indvars.iv.next119 = add nsw i64 %indvars.iv118, 1
  %101 = icmp slt i64 %indvars.iv.next119, %98
  br i1 %101, label %._crit_edge16.us..preheader.us_crit_edge, label %._crit_edge21.loopexit

._crit_edge16.us..preheader.us_crit_edge:         ; preds = %._crit_edge16.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next114, %._crit_edge.us.us ]
  %102 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv118, i64 %indvars.iv113
  store double 0.000000e+00, double* %102, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %103 = load double, double* %100, align 8
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv113
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = fadd double %106, 0.000000e+00
  store double %107, double* %102, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %108 = phi double [ %107, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %99, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond = icmp eq i64 %indvars.iv.next114, %wide.trip.count115
  br i1 %exitcond, label %._crit_edge16.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %109 = phi double [ %121, %.lr.ph.us.us.new ], [ %108, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %110 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv113
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fadd double %114, %109
  store double %115, double* %102, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %116 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv.next
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv113
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fadd double %120, %115
  store double %121, double* %102, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge21.loopexit:                           ; preds = %._crit_edge16.us
  %122 = trunc i64 %indvars.iv.next119 to i32
  br label %._crit_edge21

._crit_edge21.loopexit99:                         ; preds = %.preheader.lr.ph
  %123 = icmp sgt i32 %0, 1
  %smax = select i1 %123, i32 %0, i32 1
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit99, %._crit_edge21.loopexit
  %.lcssa20.lcssa27.lcssa = phi i32 [ %.lcssa20.lcssa.us, %._crit_edge21.loopexit ], [ %.promoted25, %._crit_edge21.loopexit99 ]
  %.lcssa22 = phi i32 [ %122, %._crit_edge21.loopexit ], [ %smax, %._crit_edge21.loopexit99 ]
  store i32 %.lcssa22, i32* %25, align 4
  store i32 %.lcssa20.lcssa27.lcssa, i32* %26, align 4
  br label %.preheader9._crit_edge

.preheader9._crit_edge:                           ; preds = %.preheader9, %._crit_edge21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1100 x double]*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1100 x double]* %2, [1100 x double]** %6, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  store i32 0, i32* %7, align 4
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %3
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.preheader.us.preheader, label %._crit_edge4.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %14 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %15 = mul nsw i64 %14, %indvars.iv11
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %16 = add nsw i64 %15, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge13

; <label>:20:                                     ; preds = %._crit_edge14
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #6
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %26 = icmp slt i64 %indvars.iv.next12, %14
  br i1 %26, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %27 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge4

._crit_edge4.loopexit9:                           ; preds = %.preheader.lr.ph
  %28 = icmp sgt i32 %0, 1
  %smax = select i1 %28, i32 %0, i32 1
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit9, %._crit_edge4.loopexit
  %.lcssa6 = phi i32 [ %27, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit9 ]
  store i32 %.lcssa6, i32* %7, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %3, %._crit_edge4
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #6
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

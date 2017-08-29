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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12.thread, %1
  %indvars.iv45 = phi i64 [ 0, %1 ], [ %indvars.iv.next46, %._crit_edge12.thread ]
  %2 = sub i64 1998, %indvars.iv45
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %8

.preheader70:                                     ; preds = %8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %5 = icmp slt i64 %indvars.iv.next46, 2000
  br i1 %5, label %._crit_edge12.thread, label %16

._crit_edge12.thread:                             ; preds = %.preheader70
  %6 = add nuw nsw i64 %4, 8
  %scevgep43 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv.next46
  %scevgep4344 = bitcast double* %scevgep43 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4344, i8 0, i64 %6, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph

; <label>:8:                                      ; preds = %8, %.lr.ph
  %indvars.iv33 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next34, %8 ]
  %9 = sub nsw i64 0, %indvars.iv33
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv33
  store double %14, double* %15, align 8
  %exitcond37 = icmp eq i64 %indvars.iv33, %indvars.iv45
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br i1 %exitcond37, label %.preheader70, label %8

; <label>:16:                                     ; preds = %.preheader70
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %17, align 8
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %19

; <label>:19:                                     ; preds = %19, %16
  %indvars.iv31 = phi i64 [ 0, %16 ], [ %indvars.iv.next32.7, %19 ]
  %20 = mul nuw nsw i64 %indvars.iv31, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %21 = mul nuw nsw i64 %indvars.iv.next32, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.1 = or i64 %indvars.iv31, 2
  %22 = mul nuw nsw i64 %indvars.iv.next32.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.2 = or i64 %indvars.iv31, 3
  %23 = mul nuw nsw i64 %indvars.iv.next32.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.3 = or i64 %indvars.iv31, 4
  %24 = mul nuw nsw i64 %indvars.iv.next32.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.4 = or i64 %indvars.iv31, 5
  %25 = mul nuw nsw i64 %indvars.iv.next32.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.5 = or i64 %indvars.iv31, 6
  %26 = mul nuw nsw i64 %indvars.iv.next32.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.6 = or i64 %indvars.iv31, 7
  %27 = mul nuw nsw i64 %indvars.iv.next32.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.7 = add nsw i64 %indvars.iv31, 8
  %exitcond95.7 = icmp eq i64 %indvars.iv.next32.7, 2000
  br i1 %exitcond95.7, label %._crit_edge.preheader.preheader, label %19

._crit_edge.preheader.preheader:                  ; preds = %19
  %28 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %30 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %82, %._crit_edge.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %82 ], [ 0, %._crit_edge.preheader.preheader ]
  %scevgep53 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv26
  %31 = add nuw nsw i64 %indvars.iv26, 1
  %scevgep55 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %31
  %32 = bitcast double* %scevgep55 to i8*
  %33 = bitcast double* %scevgep53 to i8*
  br label %.preheader67

.preheader67:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv24 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next25, %._crit_edge ]
  %34 = mul nuw nsw i64 %indvars.iv24, 16000
  %scevgep51 = getelementptr i8, i8* %18, i64 %34
  %35 = add nuw nsw i64 %34, 16000
  %scevgep52 = getelementptr i8, i8* %18, i64 %35
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv26
  %bound0 = icmp ult i8* %scevgep51, %32
  %bound1 = icmp ult i8* %33, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %36 to i8*
  %bc57 = bitcast double* %36 to i8*
  %bound058 = icmp ult i8* %scevgep51, %bc57
  %bound159 = icmp ult i8* %bc, %scevgep52
  %found.conflict60 = and i1 %bound058, %bound159
  %conflict.rdx = or i1 %found.conflict, %found.conflict60
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = or i64 %index, 1
  %38 = or i64 %index, 2
  %39 = or i64 %index, 3
  %40 = load double, double* %36, align 8, !alias.scope !1
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = insertelement <2 x double> undef, double %40, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv26
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv26
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv26
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %39, i64 %indvars.iv26
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = insertelement <2 x double> undef, double %49, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %52, i32 1
  %57 = fmul <2 x double> %42, %54
  %58 = fmul <2 x double> %44, %56
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv24, i64 %index
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  %63 = fadd <2 x double> %wide.load, %57
  %64 = fadd <2 x double> %wide.load62, %58
  %65 = bitcast double* %59 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = bitcast double* %61 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %67 = icmp eq i64 %index.next, 2000
  br i1 %67, label %._crit_edge.loopexit97, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv21 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next22.1, %scalar.ph ]
  %68 = load double, double* %36, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv26
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv24, i64 %indvars.iv21
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %75 = load double, double* %36, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next22, i64 %indvars.iv26
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv24, i64 %indvars.iv.next22
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %exitcond23.1 = icmp eq i64 %indvars.iv.next22, 1999
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  br i1 %exitcond23.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit97:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit97, %._crit_edge.loopexit
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond93, label %82, label %.preheader67

; <label>:82:                                     ; preds = %._crit_edge
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond94, label %.preheader.preheader, label %._crit_edge.preheader

.preheader.preheader:                             ; preds = %82
  %83 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %84 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %85 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %86 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %87 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %88 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %89 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge66, %.preheader.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge66 ], [ 0, %.preheader.preheader ]
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 0
  %scevgep6869 = bitcast double* %scevgep68 to i8*
  %90 = add nuw nsw i64 %indvars.iv19, 1
  %scevgep70 = getelementptr [2000 x double], [2000 x double]* %0, i64 %90, i64 0
  %scevgep7071 = bitcast double* %scevgep70 to i8*
  %91 = mul nuw nsw i64 %indvars.iv19, 16000
  %scevgep72 = getelementptr i8, i8* %18, i64 %91
  %92 = add nuw nsw i64 %91, 16000
  %scevgep73 = getelementptr i8, i8* %18, i64 %92
  %bound074 = icmp ult i8* %scevgep6869, %scevgep73
  %bound175 = icmp ult i8* %scevgep72, %scevgep7071
  %memcheck.conflict77 = and i1 %bound074, %bound175
  br i1 %memcheck.conflict77, label %scalar.ph65.preheader, label %vector.body63.preheader

vector.body63.preheader:                          ; preds = %.preheader
  br label %vector.body63

scalar.ph65.preheader:                            ; preds = %.preheader
  br label %scalar.ph65

vector.body63:                                    ; preds = %vector.body63, %vector.body63.preheader
  %index80 = phi i64 [ 0, %vector.body63.preheader ], [ %index.next81.1, %vector.body63 ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvars.iv19, i64 %index80
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load88 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load89 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !13
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %index80
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load88, <2 x i64>* %98, align 8, !alias.scope !16, !noalias !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load89, <2 x i64>* %100, align 8, !alias.scope !16, !noalias !13
  %index.next81 = or i64 %index80, 4
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv19, i64 %index.next81
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load88.1 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load89.1 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !13
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %index.next81
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load88.1, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load89.1, <2 x i64>* %108, align 8, !alias.scope !16, !noalias !13
  %index.next81.1 = add nsw i64 %index80, 8
  %109 = icmp eq i64 %index.next81.1, 2000
  br i1 %109, label %._crit_edge66.loopexit96, label %vector.body63, !llvm.loop !18

scalar.ph65:                                      ; preds = %scalar.ph65, %scalar.ph65.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph65.preheader ], [ %indvars.iv.next.4, %scalar.ph65 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv19, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next.3
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv.next.3
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge66.loopexit, label %scalar.ph65, !llvm.loop !19

._crit_edge66.loopexit:                           ; preds = %scalar.ph65
  br label %._crit_edge66

._crit_edge66.loopexit96:                         ; preds = %vector.body63
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit96, %._crit_edge66.loopexit
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond92, label %135, label %.preheader

; <label>:135:                                    ; preds = %._crit_edge66
  tail call void @free(i8* nonnull %18) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge7, %1
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge7 ], [ 0, %1 ]
  %indvars.iv24 = phi i32 [ %indvars.iv.next25, %._crit_edge7 ], [ -1, %1 ]
  %2 = add i64 %indvars.iv36, 4294967295
  %3 = and i64 %2, 4294967295
  %4 = icmp sgt i64 %indvars.iv36, 0
  br i1 %4, label %.preheader41.preheader, label %._crit_edge7

.preheader41.preheader:                           ; preds = %.preheader43
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 0
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count26 = zext i32 %indvars.iv24 to i64
  %6 = and i64 %2, 1
  %lcmp.mod44 = icmp eq i64 %6, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 0
  %8 = icmp eq i64 %3, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us, %.preheader.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge5.us ], [ %indvars.iv36, %.preheader.us.preheader ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv30
  %.pre16 = load double, double* %9, align 8
  br i1 %lcmp.mod44, label %.prol.preheader41, label %.prol.loopexit42.unr-lcssa

.prol.preheader41:                                ; preds = %.preheader.us
  br label %10

; <label>:10:                                     ; preds = %.prol.preheader41
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv30
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre16, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit42.unr-lcssa

.prol.loopexit42.unr-lcssa:                       ; preds = %.preheader.us, %10
  %indvars.iv22.unr.ph = phi i64 [ 1, %10 ], [ 0, %.preheader.us ]
  %.unr45.ph = phi double [ %15, %10 ], [ %.pre16, %.preheader.us ]
  br label %.prol.loopexit42

.prol.loopexit42:                                 ; preds = %.prol.loopexit42.unr-lcssa
  br i1 %8, label %._crit_edge5.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit42
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader.us.new
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr.ph, %.preheader.us.new ], [ %indvars.iv.next23.1, %16 ]
  %17 = phi double [ %.unr45.ph, %.preheader.us.new ], [ %29, %16 ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv22
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv30
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %9, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next23, i64 %indvars.iv30
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %9, align 8
  %exitcond27.1 = icmp eq i64 %indvars.iv.next23, %wide.trip.count26
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  br i1 %exitcond27.1, label %._crit_edge5.us.unr-lcssa, label %16

._crit_edge5.us.unr-lcssa:                        ; preds = %16
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.prol.loopexit42, %._crit_edge5.us.unr-lcssa
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond39, label %._crit_edge7.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %._crit_edge, %.preheader41.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %indvars.iv17 = phi i32 [ %indvars.iv.next18, %._crit_edge ], [ -1, %.preheader41.preheader ]
  %30 = add i64 %indvars.iv19, 4294967295
  %31 = and i64 %30, 4294967295
  %32 = icmp sgt i64 %indvars.iv19, 0
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv19
  %.pre = load double, double* %33, align 8
  br i1 %32, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %wide.trip.count = zext i32 %indvars.iv17 to i64
  %34 = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %34, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %35

; <label>:35:                                     ; preds = %.prol.preheader
  %36 = load double, double* %5, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv19
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre, %39
  store double %40, double* %33, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %35
  %.lcssa.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %40, %35 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %31, 0
  br i1 %41, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %42 ]
  %43 = phi double [ %.unr.ph, %.lr.ph.new ], [ %55, %42 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv19
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv19
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %33, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %42

._crit_edge.loopexit.unr-lcssa:                   ; preds = %42
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %55, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41
  %56 = phi double [ %.pre, %.preheader41 ], [ %.lcssa, %._crit_edge.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv19
  %58 = load double, double* %57, align 8
  %59 = fdiv double %56, %58
  store double %59, double* %33, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %indvars.iv.next18 = add nsw i32 %indvars.iv17, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next20, %indvars.iv36
  br i1 %exitcond38, label %.preheader.us.preheader, label %.preheader41

._crit_edge7.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader43
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %indvars.iv.next25 = add nsw i32 %indvars.iv24, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond40, label %60, label %.preheader43

; <label>:60:                                     ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

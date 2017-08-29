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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv61 = phi i64 [ 0, %4 ], [ %indvars.iv.next62, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv61
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %7 = trunc i64 %indvars.iv.next62 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv61
  store double %11, double* %12, align 8
  %exitcond63 = icmp eq i64 %indvars.iv61, 1999
  br i1 %exitcond63, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge20.._crit_edge1_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge20.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %13 = shl i64 %indvars.iv59, 32
  %sext = add i64 %13, 4294967296
  %14 = ashr exact i64 %sext, 32
  %15 = sub i64 1998, %indvars.iv59
  %16 = shl i64 %15, 3
  %17 = and i64 %16, 34359738360
  br label %20

._crit_edge2:                                     ; preds = %20
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %14
  %18 = add nuw nsw i64 %17, 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %19 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %19, label %._crit_edge20.._crit_edge1_crit_edge, label %30

; <label>:20:                                     ; preds = %._crit_edge106, %.lr.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge106 ], [ 0, %.lr.ph ]
  %21 = sub nsw i64 0, %indvars.iv42
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 2.000000e+03
  %26 = fadd double %25, 1.000000e+00
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv42
  store double %26, double* %27, align 8
  %exitcond50 = icmp eq i64 %indvars.iv42, %indvars.iv59
  br i1 %exitcond50, label %._crit_edge2, label %._crit_edge106

._crit_edge106:                                   ; preds = %20
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %20

._crit_edge20.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %28 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %28, i8 0, i64 %18, i32 8, i1 false)
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %29, align 8
  br label %.lr.ph

; <label>:30:                                     ; preds = %._crit_edge2
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %31, align 8
  %32 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %.._crit_edge3_crit_edge, %30
  %indvars.iv40 = phi i64 [ 0, %30 ], [ %indvars.iv.next41, %.._crit_edge3_crit_edge ]
  %33 = mul nuw nsw i64 %indvars.iv40, 16000
  %scevgep = getelementptr i8, i8* %32, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond112 = icmp ne i64 %indvars.iv.next41, 2000
  br i1 %exitcond112, label %.._crit_edge3_crit_edge, label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %.._crit_edge3_crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %76, %._crit_edge5.preheader
  %indvars.iv35 = phi i64 [ 0, %._crit_edge5.preheader ], [ %34, %76 ]
  %scevgep66 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv35
  %34 = add nuw nsw i64 %indvars.iv35, 1
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %34
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %middle.block, %._crit_edge5
  %indvars.iv33 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next34, %middle.block ]
  %35 = bitcast double* %scevgep68 to i8*
  %36 = bitcast double* %scevgep66 to i8*
  %37 = mul nuw nsw i64 %indvars.iv33, 16000
  %scevgep64 = getelementptr i8, i8* %32, i64 %37
  %38 = add nuw nsw i64 %37, 16000
  %scevgep65 = getelementptr i8, i8* %32, i64 %38
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv35
  %bound0 = icmp ult i8* %scevgep64, %35
  %bound1 = icmp ult i8* %36, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %39 to i8*
  %bound071 = icmp ult i8* %scevgep64, %bc
  %bound172 = icmp ult i8* %bc, %scevgep65
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge7
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge7
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %40 = bitcast i8* %32 to [2000 x [2000 x double]]*
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %39, align 8, !alias.scope !1
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv35
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv35
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv35
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv35
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %52, i32 1
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = fmul <2 x double> %46, %56
  %60 = fmul <2 x double> %46, %58
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv33, i64 %index
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = fadd <2 x double> %wide.load, %59
  %66 = fadd <2 x double> %wide.load75, %60
  store <2 x double> %65, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %66, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %67 = icmp eq i64 %index.next, 2000
  br i1 %67, label %middle.block.loopexit108, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %scalar.ph.scalar.ph_crit_edge ], [ 0, %scalar.ph.preheader ]
  %68 = bitcast i8* %32 to [2000 x [2000 x double]]*
  %69 = load double, double* %39, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv35
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %exitcond32 = icmp eq i64 %indvars.iv30, 1999
  br i1 %exitcond32, label %middle.block.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !12

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br label %scalar.ph

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit108:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit108, %middle.block.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond110 = icmp ne i64 %indvars.iv.next34, 2000
  br i1 %exitcond110, label %._crit_edge7, label %76

; <label>:76:                                     ; preds = %middle.block
  %exitcond111 = icmp ne i64 %34, 2000
  br i1 %exitcond111, label %._crit_edge5, label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %76
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %middle.block77, %._crit_edge8.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge8.preheader ], [ %77, %middle.block77 ]
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 0
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %77 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %77, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %78 = mul nuw nsw i64 %indvars.iv28, 16000
  %scevgep85 = getelementptr i8, i8* %32, i64 %78
  %79 = add nuw nsw i64 %78, 16000
  %scevgep86 = getelementptr i8, i8* %32, i64 %79
  %bound087 = icmp ult i8* %scevgep8182, %scevgep86
  %bound188 = icmp ult i8* %scevgep85, %scevgep8384
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %scalar.ph78.preheader, label %vector.body76.preheader

vector.body76.preheader:                          ; preds = %._crit_edge8
  br label %vector.body76

scalar.ph78.preheader:                            ; preds = %._crit_edge8
  br label %scalar.ph78

vector.body76:                                    ; preds = %vector.body76, %vector.body76.preheader
  %index93 = phi i64 [ 0, %vector.body76.preheader ], [ %index.next94, %vector.body76 ]
  %80 = bitcast i8* %32 to [2000 x [2000 x double]]*
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv28, i64 %index93
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load101 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load102 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !13
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index93
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load101, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load102, <2 x i64>* %88, align 8, !alias.scope !16, !noalias !13
  %index.next94 = add nuw nsw i64 %index93, 4
  %89 = icmp eq i64 %index.next94, 2000
  br i1 %89, label %middle.block77.loopexit107, label %vector.body76, !llvm.loop !18

scalar.ph78:                                      ; preds = %scalar.ph78.scalar.ph78_crit_edge, %scalar.ph78.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph78.scalar.ph78_crit_edge ], [ 0, %scalar.ph78.preheader ]
  %90 = bitcast i8* %32 to [2000 x [2000 x double]]*
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %90, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %middle.block77.loopexit, label %scalar.ph78.scalar.ph78_crit_edge, !llvm.loop !19

scalar.ph78.scalar.ph78_crit_edge:                ; preds = %scalar.ph78
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph78

middle.block77.loopexit:                          ; preds = %scalar.ph78
  br label %middle.block77

middle.block77.loopexit107:                       ; preds = %vector.body76
  br label %middle.block77

middle.block77:                                   ; preds = %middle.block77.loopexit107, %middle.block77.loopexit
  %exitcond109 = icmp ne i64 %77, 2000
  br i1 %exitcond109, label %._crit_edge8, label %96

; <label>:96:                                     ; preds = %middle.block77
  tail call void @free(i8* nonnull %32) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge38.._crit_edge_crit_edge, %4
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge38.._crit_edge_crit_edge ], [ 0, %4 ]
  %indvars.iv84 = phi i32 [ %indvars.iv.next85, %._crit_edge38.._crit_edge_crit_edge ], [ -1, %4 ]
  %5 = sub i64 2000, %indvars.iv92
  %6 = icmp sgt i64 %indvars.iv92, 0
  br i1 %6, label %.lr.ph28.preheader, label %.lr.ph37.split.preheader

.lr.ph28.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph28

.lr.ph37.split.preheader:                         ; preds = %._crit_edge
  %min.iters.check = icmp ult i64 %5, 4
  br i1 %min.iters.check, label %.lr.ph37.split.preheader108, label %min.iters.checked

.lr.ph37.split.preheader108:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph37.split.preheader
  %indvars.iv75.ph = phi i64 [ %indvars.iv92, %.lr.ph37.split.preheader ], [ %indvars.iv92, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %.lr.ph37.split

min.iters.checked:                                ; preds = %.lr.ph37.split.preheader
  %n.vec = and i64 %5, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv92, %n.vec
  br i1 %cmp.zero, label %.lr.ph37.split.preheader108, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %7 = add i64 %indvars.iv92, %index
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %7
  %9 = bitcast double* %8 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x i64>*
  %wide.load107 = load <2 x i64>, <2 x i64>* %11, align 8
  store <2 x i64> %wide.load, <2 x i64>* %9, align 8
  store <2 x i64> %wide.load107, <2 x i64>* %11, align 8
  %index.next = add i64 %index, 4
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %5, %n.vec
  br i1 %cmp.n, label %._crit_edge38, label %.lr.ph37.split.preheader108

.lr.ph37.split.us.preheader:                      ; preds = %._crit_edge25
  %wide.trip.count86 = zext i32 %indvars.iv84 to i64
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %._crit_edge33.us, %.lr.ph37.split.us.preheader
  %indvars.iv90 = phi i64 [ %indvars.iv92, %.lr.ph37.split.us.preheader ], [ %indvars.iv.next91, %._crit_edge33.us ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv90
  %14 = load double, double* %13, align 8
  br label %15

; <label>:15:                                     ; preds = %._crit_edge110, %.lr.ph37.split.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge110 ], [ 0, %.lr.ph37.split.us ]
  %.130.us = phi double [ %21, %._crit_edge110 ], [ %14, %.lr.ph37.split.us ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv79
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv90
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %.130.us, %20
  %exitcond87 = icmp eq i64 %indvars.iv79, %wide.trip.count86
  br i1 %exitcond87, label %._crit_edge33.us, label %._crit_edge110

._crit_edge110:                                   ; preds = %15
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  br label %15

._crit_edge33.us:                                 ; preds = %15
  store double %21, double* %13, align 8
  %indvars.iv.next91 = add nuw i64 %indvars.iv90, 1
  %exitcond124 = icmp ne i64 %indvars.iv.next91, 2000
  br i1 %exitcond124, label %.lr.ph37.split.us, label %._crit_edge38.loopexit

.lr.ph28:                                         ; preds = %._crit_edge25..lr.ph28_crit_edge, %.lr.ph28.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge25..lr.ph28_crit_edge ], [ 0, %.lr.ph28.preheader ]
  %indvars.iv67 = phi i32 [ %indvars.iv.next68, %._crit_edge25..lr.ph28_crit_edge ], [ -1, %.lr.ph28.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv71
  %23 = load double, double* %22, align 8
  %24 = icmp sgt i64 %indvars.iv71, 0
  br i1 %24, label %.lr.ph24.preheader, label %._crit_edge25

.lr.ph24.preheader:                               ; preds = %.lr.ph28
  %wide.trip.count69 = zext i32 %indvars.iv67 to i64
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24..lr.ph24_crit_edge, %.lr.ph24.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %.lr.ph24..lr.ph24_crit_edge ], [ 0, %.lr.ph24.preheader ]
  %.022 = phi double [ %30, %.lr.ph24..lr.ph24_crit_edge ], [ %23, %.lr.ph24.preheader ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv62
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv62, i64 %indvars.iv71
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %.022, %29
  %exitcond70 = icmp eq i64 %indvars.iv62, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge25.loopexit, label %.lr.ph24..lr.ph24_crit_edge

.lr.ph24..lr.ph24_crit_edge:                      ; preds = %.lr.ph24
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br label %.lr.ph24

._crit_edge25.loopexit:                           ; preds = %.lr.ph24
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.lr.ph28
  %.0.lcssa = phi double [ %23, %.lr.ph28 ], [ %30, %._crit_edge25.loopexit ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71, i64 %indvars.iv71
  %32 = load double, double* %31, align 8
  %33 = fdiv double %.0.lcssa, %32
  store double %33, double* %22, align 8
  %indvars.iv.next72 = add nuw i64 %indvars.iv71, 1
  %34 = icmp slt i64 %indvars.iv.next72, %indvars.iv92
  br i1 %34, label %._crit_edge25..lr.ph28_crit_edge, label %.lr.ph37.split.us.preheader

._crit_edge25..lr.ph28_crit_edge:                 ; preds = %._crit_edge25
  %indvars.iv.next68 = add nsw i32 %indvars.iv67, 1
  br label %.lr.ph28

.lr.ph37.split:                                   ; preds = %.lr.ph37.split..lr.ph37.split_crit_edge, %.lr.ph37.split.preheader108
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %.lr.ph37.split..lr.ph37.split_crit_edge ], [ %indvars.iv75.ph, %.lr.ph37.split.preheader108 ]
  %exitcond77 = icmp eq i64 %indvars.iv75, 1999
  br i1 %exitcond77, label %._crit_edge38.loopexit120, label %.lr.ph37.split..lr.ph37.split_crit_edge, !llvm.loop !21

.lr.ph37.split..lr.ph37.split_crit_edge:          ; preds = %.lr.ph37.split
  %indvars.iv.next76 = add nuw i64 %indvars.iv75, 1
  br label %.lr.ph37.split

._crit_edge38.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge38

._crit_edge38.loopexit120:                        ; preds = %.lr.ph37.split
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit120, %._crit_edge38.loopexit, %middle.block
  %indvars.iv.next93 = add nuw i64 %indvars.iv92, 1
  %35 = icmp slt i64 %indvars.iv.next93, 2000
  br i1 %35, label %._crit_edge38.._crit_edge_crit_edge, label %._crit_edge1.preheader

._crit_edge38.._crit_edge_crit_edge:              ; preds = %._crit_edge38
  %indvars.iv.next85 = add nsw i32 %indvars.iv84, 1
  br label %._crit_edge

._crit_edge1.preheader:                           ; preds = %._crit_edge38
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge17.._crit_edge1_crit_edge, %._crit_edge1.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge17.._crit_edge1_crit_edge ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv56 = phi i32 [ %indvars.iv.next57, %._crit_edge17.._crit_edge1_crit_edge ], [ -1, %._crit_edge1.preheader ]
  %36 = getelementptr inbounds double, double* %1, i64 %indvars.iv60
  %37 = load double, double* %36, align 8
  %38 = icmp sgt i64 %indvars.iv60, 0
  br i1 %38, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %._crit_edge1
  %wide.trip.count58 = zext i32 %indvars.iv56 to i64
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16..lr.ph16_crit_edge, %.lr.ph16.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.lr.ph16..lr.ph16_crit_edge ], [ 0, %.lr.ph16.preheader ]
  %.214 = phi double [ %44, %.lr.ph16..lr.ph16_crit_edge ], [ %37, %.lr.ph16.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv51
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %.214, %43
  %exitcond59 = icmp eq i64 %indvars.iv51, %wide.trip.count58
  br i1 %exitcond59, label %._crit_edge17.loopexit, label %.lr.ph16..lr.ph16_crit_edge

.lr.ph16..lr.ph16_crit_edge:                      ; preds = %.lr.ph16
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br label %.lr.ph16

._crit_edge17.loopexit:                           ; preds = %.lr.ph16
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %37, %._crit_edge1 ], [ %44, %._crit_edge17.loopexit ]
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv60
  store double %.2.lcssa, double* %45, align 8
  %indvars.iv.next61 = add nuw i64 %indvars.iv60, 1
  %46 = icmp slt i64 %indvars.iv.next61, 2000
  br i1 %46, label %._crit_edge17.._crit_edge1_crit_edge, label %._crit_edge3.preheader

._crit_edge17.._crit_edge1_crit_edge:             ; preds = %._crit_edge17
  %indvars.iv.next57 = add nsw i32 %indvars.iv56, 1
  br label %._crit_edge1

._crit_edge3.preheader:                           ; preds = %._crit_edge17
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge10.._crit_edge3_crit_edge
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge10.._crit_edge3_crit_edge ], [ 1999, %._crit_edge3.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge10.._crit_edge3_crit_edge ], [ 2000, %._crit_edge3.preheader ]
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %48 = load double, double* %47, align 8
  %49 = add nsw i64 %indvars.iv48, 1
  %50 = icmp slt i64 %49, 2000
  br i1 %50, label %._crit_edge3..lr.ph_crit_edge, label %._crit_edge10.thread

._crit_edge10.thread:                             ; preds = %._crit_edge3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %52 = load double, double* %51, align 8
  %53 = fdiv double %48, %52
  %54 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %53, double* %54, align 8
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge3..lr.ph_crit_edge:                    ; preds = %._crit_edge3
  %55 = sext i32 %indvars.iv to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %._crit_edge3..lr.ph_crit_edge
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %.lr.ph..lr.ph_crit_edge ], [ %55, %._crit_edge3..lr.ph_crit_edge ]
  %.37 = phi double [ %61, %.lr.ph..lr.ph_crit_edge ], [ %48, %._crit_edge3..lr.ph_crit_edge ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %.37, %60
  %exitcond = icmp eq i64 %indvars.iv46, 1999
  br i1 %exitcond, label %._crit_edge10, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  br label %.lr.ph

._crit_edge10:                                    ; preds = %.lr.ph
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %63 = load double, double* %62, align 8
  %64 = fdiv double %61, %63
  %65 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %64, double* %65, align 8
  %66 = icmp sgt i64 %indvars.iv48, 0
  br i1 %66, label %._crit_edge10.._crit_edge3_crit_edge, label %67

._crit_edge10.._crit_edge3_crit_edge:             ; preds = %._crit_edge10, %._crit_edge10.thread
  %indvars.iv.next49 = add i64 %indvars.iv48, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %._crit_edge3

; <label>:67:                                     ; preds = %._crit_edge10
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2, label %15

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}

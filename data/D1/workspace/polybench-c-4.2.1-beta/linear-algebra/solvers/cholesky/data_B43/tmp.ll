; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader62.lr.ph:
  br label %.lr.ph78

.lr.ph78:                                         ; preds = %._crit_edge82, %.preheader62.lr.ph
  %indvars.iv138 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge82 ]
  %indvars.iv136 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next137, %._crit_edge82 ]
  %2 = mul nuw nsw i64 %indvars.iv138, 2001
  %3 = add nuw nsw i64 %2, 1
  %4 = sub nsw i64 1998, %indvars.iv138
  %5 = shl i64 %4, 3
  br label %._crit_edge

.preheader61:                                     ; preds = %._crit_edge
  %scevgep132 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %6 = and i64 %5, 34359738360
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %7 = icmp slt i64 %indvars.iv.next139, 2000
  br i1 %7, label %._crit_edge82.loopexit, label %._crit_edge82

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph78
  %indvars.iv120 = phi i64 [ 0, %.lr.ph78 ], [ %indvars.iv.next121, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv120
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv120
  store double %13, double* %14, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next121, %indvars.iv136
  br i1 %exitcond127, label %.preheader61, label %._crit_edge

._crit_edge82.loopexit:                           ; preds = %.preheader61
  %15 = add nuw nsw i64 %6, 8
  %scevgep132133 = bitcast double* %scevgep132 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep132133, i8 0, i64 %15, i32 8, i1 false)
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %.preheader61, %._crit_edge82.loopexit
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %16, align 8
  %exitcond141 = icmp eq i64 %indvars.iv.next139, 2000
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  br i1 %exitcond141, label %._crit_edge84, label %.lr.ph78

._crit_edge84:                                    ; preds = %._crit_edge82
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge75.us, %._crit_edge84
  %indvars.iv116 = phi i64 [ 0, %._crit_edge84 ], [ %indvars.iv.next117.7, %._crit_edge75.us ]
  %18 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %19 = mul nuw nsw i64 %indvars.iv.next117, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %20 = mul nuw nsw i64 %indvars.iv.next117.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %21 = mul nuw nsw i64 %indvars.iv.next117.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %22 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.4 = or i64 %indvars.iv116, 5
  %23 = mul nuw nsw i64 %indvars.iv.next117.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.5 = or i64 %indvars.iv116, 6
  %24 = mul nuw nsw i64 %indvars.iv.next117.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.6 = or i64 %indvars.iv116, 7
  %25 = mul nuw nsw i64 %indvars.iv.next117.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.7 = add nuw nsw i64 %indvars.iv116, 8
  %exitcond119.7 = icmp eq i64 %indvars.iv.next117.7, 2000
  br i1 %exitcond119.7, label %.preheader57.us.us.preheader.preheader, label %._crit_edge75.us

.preheader57.us.us.preheader.preheader:           ; preds = %._crit_edge75.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %.preheader57.us.us.preheader.preheader, %._crit_edge70.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge70.us ], [ 0, %.preheader57.us.us.preheader.preheader ]
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv108
  %scevgep149150 = bitcast double* %scevgep149 to i8*
  %27 = add nuw nsw i64 %indvars.iv108, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %27
  %scevgep151152 = bitcast double* %scevgep151 to i8*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  br label %.preheader.us

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us ]
  %28 = mul nuw nsw i64 %indvars.iv104, 16000
  %scevgep147 = getelementptr i8, i8* %17, i64 %28
  %29 = add nuw nsw i64 %28, 16000
  %scevgep148 = getelementptr i8, i8* %17, i64 %29
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  %bound0 = icmp ult i8* %scevgep147, %scevgep151152
  %bound1 = icmp ult i8* %scevgep149150, %scevgep148
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %30 to i8*
  %bc153 = bitcast double* %30 to i8*
  %bound0154 = icmp ult i8* %scevgep147, %bc153
  %bound1155 = icmp ult i8* %bc, %scevgep148
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  br i1 %conflict.rdx, label %._crit_edge142.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader57.us.us
  br label %vector.body

._crit_edge142.preheader:                         ; preds = %.preheader57.us.us
  br label %._crit_edge142

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %31 = or i64 %index, 1
  %32 = or i64 %index, 2
  %33 = or i64 %index, 3
  %34 = load double, double* %30, align 8, !alias.scope !1
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = insertelement <2 x double> undef, double %34, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv108
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %31, i64 %indvars.iv108
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %32, i64 %indvars.iv108
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %33, i64 %indvars.iv108
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fmul <2 x double> %36, %48
  %52 = fmul <2 x double> %38, %50
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv104, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = fadd <2 x double> %wide.load, %51
  %58 = fadd <2 x double> %wide.load158, %52
  %59 = bitcast double* %53 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = bitcast double* %55 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %._crit_edge68.us.us.loopexit187, label %vector.body, !llvm.loop !9

._crit_edge68.us.us.loopexit:                     ; preds = %._crit_edge142
  br label %._crit_edge68.us.us

._crit_edge68.us.us.loopexit187:                  ; preds = %vector.body
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit187, %._crit_edge68.us.us.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge70.us, label %.preheader57.us.us

._crit_edge142:                                   ; preds = %._crit_edge142, %._crit_edge142.preheader
  %indvars.iv100 = phi i64 [ 0, %._crit_edge142.preheader ], [ %indvars.iv.next101.1, %._crit_edge142 ]
  %62 = load double, double* %30, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv108
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv104, i64 %indvars.iv100
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %69 = load double, double* %30, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next101, i64 %indvars.iv108
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next101
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 2000
  br i1 %exitcond103.1, label %._crit_edge68.us.us.loopexit, label %._crit_edge142, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 0
  %scevgep164165 = bitcast double* %scevgep164 to i8*
  %76 = add nuw nsw i64 %indvars.iv96, 1
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %1, i64 %76, i64 0
  %scevgep166167 = bitcast double* %scevgep166 to i8*
  %77 = mul nuw nsw i64 %indvars.iv96, 16000
  %scevgep168 = getelementptr i8, i8* %17, i64 %77
  %78 = add nuw nsw i64 %77, 16000
  %scevgep169 = getelementptr i8, i8* %17, i64 %78
  %bound0170 = icmp ult i8* %scevgep164165, %scevgep169
  %bound1171 = icmp ult i8* %scevgep168, %scevgep166167
  %memcheck.conflict173 = and i1 %bound0170, %bound1171
  br i1 %memcheck.conflict173, label %._crit_edge143.preheader, label %vector.body159.preheader

vector.body159.preheader:                         ; preds = %.preheader.us
  br label %vector.body159

._crit_edge143.preheader:                         ; preds = %.preheader.us
  br label %._crit_edge143

vector.body159:                                   ; preds = %vector.body159, %vector.body159.preheader
  %index176 = phi i64 [ 0, %vector.body159.preheader ], [ %index.next177.1, %vector.body159 ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %index176
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load184 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load185 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %index176
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load184, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load185, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %index.next177 = or i64 %index176, 4
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %index.next177
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load184.1 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load185.1 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %index.next177
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load184.1, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load185.1, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %index.next177.1 = add nuw nsw i64 %index176, 8
  %95 = icmp eq i64 %index.next177.1, 2000
  br i1 %95, label %._crit_edge.us.loopexit186, label %vector.body159, !llvm.loop !18

._crit_edge143:                                   ; preds = %._crit_edge143, %._crit_edge143.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge143.preheader ], [ %indvars.iv.next.4, %._crit_edge143 ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %indvars.iv
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv.next.3
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond95.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond95.4, label %._crit_edge.us.loopexit, label %._crit_edge143, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %._crit_edge143
  br label %._crit_edge.us

._crit_edge.us.loopexit186:                       ; preds = %vector.body159
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit186, %._crit_edge.us.loopexit
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next97, 2000
  br i1 %exitcond99, label %._crit_edge65, label %.preheader.us

._crit_edge65:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %17) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader33.preheader:
  br label %.preheader33

.preheader33:                                     ; preds = %._crit_edge39, %.preheader33.preheader
  %indvars.iv78 = phi i2 [ %indvars.iv.next79, %._crit_edge39 ], [ 0, %.preheader33.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge39 ], [ 0, %.preheader33.preheader ]
  %2 = zext i2 %indvars.iv78 to i64
  %3 = add nsw i64 %indvars.iv65, -1
  %4 = icmp sgt i64 %indvars.iv65, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %.preheader33
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 0
  br label %.preheader

.lr.ph38:                                         ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %.pre72 = load double, double* %6, align 8
  %xtraiter73 = and i64 %indvars.iv65, 3
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod74, label %._crit_edge70.prol.loopexit, label %._crit_edge70.prol.preheader

._crit_edge70.prol.preheader:                     ; preds = %.lr.ph38
  br label %._crit_edge70.prol

._crit_edge70.prol:                               ; preds = %._crit_edge70.prol, %._crit_edge70.prol.preheader
  %7 = phi double [ %.pre72, %._crit_edge70.prol.preheader ], [ %11, %._crit_edge70.prol ]
  %indvars.iv57.prol = phi i64 [ 0, %._crit_edge70.prol.preheader ], [ %indvars.iv.next58.prol, %._crit_edge70.prol ]
  %prol.iter = phi i64 [ %xtraiter73, %._crit_edge70.prol.preheader ], [ %prol.iter.sub, %._crit_edge70.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv57.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge70.prol.loopexit.unr-lcssa, label %._crit_edge70.prol, !llvm.loop !20

._crit_edge70.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge70.prol
  br label %._crit_edge70.prol.loopexit

._crit_edge70.prol.loopexit:                      ; preds = %.lr.ph38, %._crit_edge70.prol.loopexit.unr-lcssa
  %.unr75 = phi double [ %.pre72, %.lr.ph38 ], [ %11, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %indvars.iv57.unr = phi i64 [ 0, %.lr.ph38 ], [ %2, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %3, 3
  br i1 %12, label %._crit_edge39.loopexit, label %.lr.ph38.new

.lr.ph38.new:                                     ; preds = %._crit_edge70.prol.loopexit
  br label %._crit_edge70

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv49, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv49
  %.pre = load double, double* %14, align 8
  br i1 %13, label %._crit_edge69.preheader, label %._crit_edge

._crit_edge69.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv49, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge69.prol.loopexit.unr-lcssa, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %._crit_edge69.preheader
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  %15 = load double, double* %5, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %._crit_edge69.prol.loopexit.unr-lcssa

._crit_edge69.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge69.preheader, %._crit_edge69.prol
  %.lcssa.unr.ph = phi double [ %19, %._crit_edge69.prol ], [ undef, %._crit_edge69.preheader ]
  %.unr.ph = phi double [ %19, %._crit_edge69.prol ], [ %.pre, %._crit_edge69.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge69.prol ], [ 0, %._crit_edge69.preheader ]
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %._crit_edge69.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %indvars.iv49, 1
  br i1 %20, label %._crit_edge.loopexit, label %._crit_edge69.preheader.new

._crit_edge69.preheader.new:                      ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %._crit_edge69.preheader.new
  %21 = phi double [ %.unr.ph, %._crit_edge69.preheader.new ], [ %33, %._crit_edge69 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge69.preheader.new ], [ %indvars.iv.next.1, %._crit_edge69 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond48.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge69

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge69
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge69.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge69.prol.loopexit ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv49
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next50, %indvars.iv65
  br i1 %exitcond56, label %.lr.ph38, label %.preheader

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph38.new
  %38 = phi double [ %.unr75, %.lr.ph38.new ], [ %54, %._crit_edge70 ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.lr.ph38.new ], [ %indvars.iv.next58.3, %._crit_edge70 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv57
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %6, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next58
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next58.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next58.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next58.3, %indvars.iv65
  br i1 %exitcond64.3, label %._crit_edge39.loopexit.unr-lcssa, label %._crit_edge70

._crit_edge39.loopexit.unr-lcssa:                 ; preds = %._crit_edge70
  br label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %._crit_edge70.prol.loopexit, %._crit_edge39.loopexit.unr-lcssa
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %56 = load double, double* %55, align 8
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %55, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 2000
  %indvars.iv.next79 = add i2 %indvars.iv78, 1
  br i1 %exitcond68, label %._crit_edge42, label %.preheader33

._crit_edge42:                                    ; preds = %._crit_edge39
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %indvars.iv19 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv21, 2000
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge25 ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge25

; <label>:11:                                     ; preds = %._crit_edge26
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge26, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %indvars.iv19
  br i1 %exitcond18, label %._crit_edge, label %._crit_edge26

._crit_edge:                                      ; preds = %._crit_edge25
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br i1 %exitcond24, label %._crit_edge12, label %.lr.ph

._crit_edge12:                                    ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

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

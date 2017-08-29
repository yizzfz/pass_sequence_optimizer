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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.lr.ph, %.loopexit186
  %indvars.iv = phi i64 [ 1995, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next194, %.loopexit186 ]
  %indvars.iv67104 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next68, %.loopexit186 ]
  %indvars.iv69102 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next6098, %.loopexit186 ]
  %1 = lshr i64 %indvars.iv, 2
  %2 = add i64 %1, 1
  %3 = trunc i64 %2 to i2
  %4 = zext i2 %3 to i64
  %5 = shl i64 %4, 2
  %6 = sub nuw nsw i64 1999, %indvars.iv69102
  %7 = add nsw i64 %6, -4
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  br label %._crit_edge

._crit_edge71.preheader:                          ; preds = %._crit_edge
  %10 = sub nuw nsw i64 1999, %indvars.iv69102
  %indvars.iv.next6098 = add nuw nsw i64 %indvars.iv69102, 1
  %exitcond6699 = icmp eq i64 %indvars.iv69102, 1999
  br i1 %exitcond6699, label %.loopexit186, label %.lr.ph101

.lr.ph101:                                        ; preds = %._crit_edge71.preheader
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %._crit_edge71.preheader191, label %min.iters.checked

._crit_edge71.preheader191:                       ; preds = %middle.block, %min.iters.checked, %.lr.ph101
  %indvars.iv.next60100.ph = phi i64 [ %indvars.iv.next6098, %min.iters.checked ], [ %indvars.iv.next6098, %.lr.ph101 ], [ %ind.end, %middle.block ]
  br label %._crit_edge71

min.iters.checked:                                ; preds = %.lr.ph101
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next6098, %n.vec
  br i1 %cmp.zero, label %._crit_edge71.preheader191, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %11 = add nuw nsw i64 %indvars.iv.next6098, %index.prol
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %5, %vector.body.prol.loopexit.unr-lcssa ]
  %16 = icmp ult i64 %7, 12
  br i1 %16, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %17 = add i64 %indvars.iv.next6098, %index
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %index.next = add i64 %index, 4
  %22 = add i64 %indvars.iv.next6098, %index.next
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %22
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %index.next.1 = add i64 %index, 8
  %27 = add i64 %indvars.iv.next6098, %index.next.1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next.2 = add i64 %index, 12
  %32 = add i64 %indvars.iv.next6098, %index.next.2
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %36, align 8
  %index.next.3 = add i64 %index, 16
  %37 = icmp eq i64 %index.next.3, %n.vec
  br i1 %37, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %.loopexit186, label %._crit_edge71.preheader191

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv5197 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next52, %._crit_edge ]
  %38 = sub nsw i64 0, %indvars.iv5197
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 2000
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, 2.000000e+03
  %43 = fadd double %42, 1.000000e+00
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %indvars.iv5197
  store double %43, double* %44, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5197, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next52, %indvars.iv67104
  br i1 %exitcond56, label %._crit_edge71.preheader, label %._crit_edge

._crit_edge71:                                    ; preds = %._crit_edge71.preheader191, %._crit_edge71
  %indvars.iv.next60100 = phi i64 [ %indvars.iv.next60, %._crit_edge71 ], [ %indvars.iv.next60100.ph, %._crit_edge71.preheader191 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69102, i64 %indvars.iv.next60100
  store double 0.000000e+00, double* %45, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv.next60100, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next60100, 1999
  br i1 %exitcond66, label %.loopexit186.loopexit, label %._crit_edge71, !llvm.loop !6

.loopexit186.loopexit:                            ; preds = %._crit_edge71
  br label %.loopexit186

.loopexit186:                                     ; preds = %.loopexit186.loopexit, %middle.block, %._crit_edge71.preheader
  %indvars.iv69103 = phi i64 [ 1999, %._crit_edge71.preheader ], [ %indvars.iv69102, %middle.block ], [ %indvars.iv69102, %.loopexit186.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69103, i64 %indvars.iv69102
  store double 1.000000e+00, double* %46, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67104, 1
  %indvars.iv.next194 = add nsw i64 %indvars.iv, -1
  %exitcond195 = icmp ne i64 %indvars.iv.next6098, 2000
  br i1 %exitcond195, label %._crit_edge.preheader, label %.loopexit187

.loopexit187:                                     ; preds = %.loopexit186
  %47 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %48 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %._crit_edge72.preheader

._crit_edge72.preheader:                          ; preds = %.loopexit187, %middle.block108
  %indvars.iv4995 = phi i64 [ 0, %.loopexit187 ], [ %indvars.iv.next50, %middle.block108 ]
  br label %vector.body107

vector.body107:                                   ; preds = %vector.body107, %._crit_edge72.preheader
  %index116 = phi i64 [ 0, %._crit_edge72.preheader ], [ %index.next117.4, %vector.body107 ]
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv4995, i64 %index116
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %54, align 8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %56, align 8
  %index.next117 = add nuw nsw i64 %index116, 4
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv4995, i64 %index.next117
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %58, align 8
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %60, align 8
  %index.next117.1 = add nuw nsw i64 %index116, 8
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv4995, i64 %index.next117.1
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %64, align 8
  %index.next117.2 = add nuw nsw i64 %index116, 12
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv4995, i64 %index.next117.2
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %66, align 8
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %68, align 8
  %index.next117.3 = add nuw nsw i64 %index116, 16
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv4995, i64 %index.next117.3
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %70, align 8
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %72, align 8
  %index.next117.4 = add nuw nsw i64 %index116, 20
  %73 = icmp eq i64 %index.next117.4, 2000
  br i1 %73, label %middle.block108, label %vector.body107, !llvm.loop !8

middle.block108:                                  ; preds = %vector.body107
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv4995, 1
  %exitcond193 = icmp ne i64 %indvars.iv.next50, 2000
  br i1 %exitcond193, label %._crit_edge72.preheader, label %._crit_edge74.preheader.preheader

._crit_edge74.preheader.preheader:                ; preds = %middle.block108
  br label %._crit_edge74.preheader

._crit_edge74.preheader:                          ; preds = %._crit_edge74.preheader.preheader, %.loopexit184
  %indvars.iv4390 = phi i64 [ %indvars.iv.next44, %.loopexit184 ], [ 0, %._crit_edge74.preheader.preheader ]
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4390
  %74 = add nsw i64 %indvars.iv4390, -1999
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %0, i64 2000, i64 %74
  %75 = bitcast double* %scevgep136 to i8*
  %76 = bitcast double* %scevgep134 to i8*
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge74, %._crit_edge74.preheader
  %indvars.iv3987 = phi i64 [ 0, %._crit_edge74.preheader ], [ %indvars.iv.next40, %._crit_edge74 ]
  %77 = mul nuw nsw i64 %indvars.iv3987, 16000
  %scevgep = getelementptr i8, i8* %47, i64 %77
  %78 = add nuw nsw i64 %77, 16000
  %scevgep133 = getelementptr i8, i8* %47, i64 %78
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3987, i64 %indvars.iv4390
  %bound0 = icmp ult i8* %scevgep, %75
  %bound1 = icmp ult i8* %76, %scevgep133
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %79 to i8*
  %bound0139 = icmp ult i8* %scevgep, %bc
  %bound1140 = icmp ult i8* %bc, %scevgep133
  %found.conflict141 = and i1 %bound0139, %bound1140
  %conflict.rdx = or i1 %found.conflict, %found.conflict141
  br i1 %conflict.rdx, label %scalar.ph126.preheader, label %vector.body124.preheader

vector.body124.preheader:                         ; preds = %.lr.ph84
  br label %vector.body124

scalar.ph126.preheader:                           ; preds = %.lr.ph84
  br label %scalar.ph126

vector.body124:                                   ; preds = %vector.body124.preheader, %vector.body124
  %index143 = phi i64 [ %index.next144, %vector.body124 ], [ 0, %vector.body124.preheader ]
  %80 = or i64 %index143, 1
  %81 = or i64 %index143, 2
  %82 = or i64 %index143, 3
  %83 = load double, double* %79, align 8, !alias.scope !9
  %84 = insertelement <2 x double> undef, double %83, i32 0
  %85 = shufflevector <2 x double> %84, <2 x double> undef, <2 x i32> zeroinitializer
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index143, i64 %indvars.iv4390
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %80, i64 %indvars.iv4390
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %81, i64 %indvars.iv4390
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %82, i64 %indvars.iv4390
  %90 = load double, double* %86, align 8, !alias.scope !12
  %91 = load double, double* %87, align 8, !alias.scope !12
  %92 = load double, double* %88, align 8, !alias.scope !12
  %93 = load double, double* %89, align 8, !alias.scope !12
  %94 = insertelement <2 x double> undef, double %90, i32 0
  %95 = insertelement <2 x double> %94, double %91, i32 1
  %96 = insertelement <2 x double> undef, double %92, i32 0
  %97 = insertelement <2 x double> %96, double %93, i32 1
  %98 = fmul <2 x double> %85, %95
  %99 = fmul <2 x double> %85, %97
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3987, i64 %index143
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !14, !noalias !16
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !14, !noalias !16
  %104 = fadd <2 x double> %wide.load, %98
  %105 = fadd <2 x double> %wide.load151, %99
  store <2 x double> %104, <2 x double>* %101, align 8, !alias.scope !14, !noalias !16
  store <2 x double> %105, <2 x double>* %103, align 8, !alias.scope !14, !noalias !16
  %index.next144 = add nuw nsw i64 %index143, 4
  %106 = icmp eq i64 %index.next144, 2000
  br i1 %106, label %._crit_edge74.loopexit190, label %vector.body124, !llvm.loop !17

scalar.ph126:                                     ; preds = %scalar.ph126, %scalar.ph126.preheader
  %indvars.iv3582 = phi i64 [ 0, %scalar.ph126.preheader ], [ %indvars.iv.next36.1, %scalar.ph126 ]
  %107 = load double, double* %79, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %indvars.iv4390
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3987, i64 %indvars.iv3582
  %112 = load double, double* %111, align 8
  %113 = fadd double %112, %110
  store double %113, double* %111, align 8
  %indvars.iv.next36 = or i64 %indvars.iv3582, 1
  %114 = load double, double* %79, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next36, i64 %indvars.iv4390
  %116 = load double, double* %115, align 8
  %117 = fmul double %114, %116
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3987, i64 %indvars.iv.next36
  %119 = load double, double* %118, align 8
  %120 = fadd double %119, %117
  store double %120, double* %118, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv3582, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next36.1, 2000
  br i1 %exitcond38.1, label %._crit_edge74.loopexit, label %scalar.ph126, !llvm.loop !18

._crit_edge74.loopexit:                           ; preds = %scalar.ph126
  br label %._crit_edge74

._crit_edge74.loopexit190:                        ; preds = %vector.body124
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit190, %._crit_edge74.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv3987, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond42, label %.loopexit184, label %.lr.ph84

.loopexit184:                                     ; preds = %._crit_edge74
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4390, 1
  %exitcond192 = icmp ne i64 %indvars.iv.next44, 2000
  br i1 %exitcond192, label %._crit_edge74.preheader, label %._crit_edge75.preheader.preheader

._crit_edge75.preheader.preheader:                ; preds = %.loopexit184
  br label %._crit_edge75.preheader

._crit_edge75.preheader:                          ; preds = %._crit_edge75.preheader.preheader, %middle.block153
  %indvars.iv3378 = phi i64 [ %indvars.iv.next34, %middle.block153 ], [ 0, %._crit_edge75.preheader.preheader ]
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 0
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 2000
  %121 = mul nuw nsw i64 %indvars.iv3378, 16000
  %scevgep165 = getelementptr i8, i8* %47, i64 %121
  %122 = add nuw nsw i64 %121, 16000
  %scevgep166 = getelementptr i8, i8* %47, i64 %122
  %123 = bitcast double* %scevgep163 to i8*
  %124 = bitcast double* %scevgep161 to i8*
  %bound0167 = icmp ult i8* %124, %scevgep166
  %bound1168 = icmp ult i8* %scevgep165, %123
  %memcheck.conflict170 = and i1 %bound0167, %bound1168
  br i1 %memcheck.conflict170, label %._crit_edge75.preheader188, label %vector.body152.preheader

vector.body152.preheader:                         ; preds = %._crit_edge75.preheader
  br label %vector.body152

._crit_edge75.preheader188:                       ; preds = %._crit_edge75.preheader
  br label %._crit_edge75

vector.body152:                                   ; preds = %vector.body152, %vector.body152.preheader
  %index173 = phi i64 [ 0, %vector.body152.preheader ], [ %index.next174.1, %vector.body152 ]
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %index173
  %126 = bitcast double* %125 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %126, align 8, !alias.scope !19
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %128, align 8, !alias.scope !19
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %index173
  %130 = bitcast double* %129 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %130, align 8, !alias.scope !22, !noalias !19
  %131 = getelementptr double, double* %129, i64 2
  %132 = bitcast double* %131 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %132, align 8, !alias.scope !22, !noalias !19
  %index.next174 = or i64 %index173, 4
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %index.next174
  %134 = bitcast double* %133 to <2 x i64>*
  %wide.load181.1 = load <2 x i64>, <2 x i64>* %134, align 8, !alias.scope !19
  %135 = getelementptr double, double* %133, i64 2
  %136 = bitcast double* %135 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %136, align 8, !alias.scope !19
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %index.next174
  %138 = bitcast double* %137 to <2 x i64>*
  store <2 x i64> %wide.load181.1, <2 x i64>* %138, align 8, !alias.scope !22, !noalias !19
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %140, align 8, !alias.scope !22, !noalias !19
  %index.next174.1 = add nuw nsw i64 %index173, 8
  %141 = icmp eq i64 %index.next174.1, 2000
  br i1 %141, label %middle.block153.loopexit189, label %vector.body152, !llvm.loop !24

._crit_edge75:                                    ; preds = %._crit_edge75, %._crit_edge75.preheader188
  %indvars.iv77 = phi i64 [ 0, %._crit_edge75.preheader188 ], [ %indvars.iv.next.4, %._crit_edge75 ]
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %indvars.iv77
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %indvars.iv77
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv77, 1
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %indvars.iv.next
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %indvars.iv.next
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv77, 2
  %152 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %indvars.iv.next.1
  %153 = bitcast double* %152 to i64*
  %154 = load i64, i64* %153, align 8
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %indvars.iv.next.1
  %156 = bitcast double* %155 to i64*
  store i64 %154, i64* %156, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv77, 3
  %157 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %indvars.iv.next.2
  %158 = bitcast double* %157 to i64*
  %159 = load i64, i64* %158, align 8
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %indvars.iv.next.2
  %161 = bitcast double* %160 to i64*
  store i64 %159, i64* %161, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv77, 4
  %162 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv3378, i64 %indvars.iv.next.3
  %163 = bitcast double* %162 to i64*
  %164 = load i64, i64* %163, align 8
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3378, i64 %indvars.iv.next.3
  %166 = bitcast double* %165 to i64*
  store i64 %164, i64* %166, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv77, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block153.loopexit, label %._crit_edge75, !llvm.loop !25

middle.block153.loopexit:                         ; preds = %._crit_edge75
  br label %middle.block153

middle.block153.loopexit189:                      ; preds = %vector.body152
  br label %middle.block153

middle.block153:                                  ; preds = %middle.block153.loopexit189, %middle.block153.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3378, 1
  %exitcond = icmp ne i64 %indvars.iv.next34, 2000
  br i1 %exitcond, label %._crit_edge75.preheader, label %.loopexit183

.loopexit183:                                     ; preds = %middle.block153
  call void @free(i8* %47) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.lr.ph, %.loopexit
  %indvars.iv3858 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next39, %.loopexit ]
  %cond = icmp eq i64 %indvars.iv3858, 0
  br i1 %cond, label %.lr.ph57.preheader, label %.lr.ph48.preheader

.lr.ph48.preheader:                               ; preds = %._crit_edge.preheader
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 0
  br label %.lr.ph48

.lr.ph57.preheader:                               ; preds = %._crit_edge40.preheader, %._crit_edge.preheader
  %indvars.iv3255.ph = phi i64 [ %indvars.iv3858, %._crit_edge40.preheader ], [ 0, %._crit_edge.preheader ]
  %xtraiter64 = and i64 %indvars.iv3858, 1
  %lcmp.mod65 = icmp eq i64 %xtraiter64, 0
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 0
  %3 = icmp eq i64 %indvars.iv3858, 1
  br label %.lr.ph57

._crit_edge40.preheader:                          ; preds = %._crit_edge
  %exitcond3754 = icmp eq i64 %indvars.iv3858, 2000
  br i1 %exitcond3754, label %.loopexit, label %.lr.ph57.preheader

.lr.ph48:                                         ; preds = %.lr.ph48.preheader, %._crit_edge
  %indvars.iv1946 = phi i64 [ %indvars.iv.next20, %._crit_edge ], [ 0, %.lr.ph48.preheader ]
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 %indvars.iv1946
  %exitcond41 = icmp eq i64 %indvars.iv1946, 0
  %.pre61 = load double, double* %4, align 8
  br i1 %exitcond41, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph48
  %xtraiter = and i64 %indvars.iv1946, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %5 = load double, double* %1, align 8
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv1946
  %7 = load double, double* %6, align 8
  %8 = fmul double %5, %7
  %9 = fsub double %.pre61, %8
  store double %9, double* %4, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %9, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %9, %.lr.ph.prol ], [ %.pre61, %.lr.ph.preheader ]
  %indvars.iv42.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %10 = icmp eq i64 %indvars.iv1946, 1
  br i1 %10, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %11 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %23, %.lr.ph ]
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 %indvars.iv42
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv1946
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %11, %16
  store double %17, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv42, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv1946
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %4, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv42, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1946
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %23, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph48
  %24 = phi double [ %.pre61, %.lr.ph48 ], [ %.lcssa, %._crit_edge.loopexit ]
  %indvars.iv1947 = phi i64 [ 0, %.lr.ph48 ], [ %indvars.iv1946, %._crit_edge.loopexit ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1947, i64 %indvars.iv1946
  %26 = load double, double* %25, align 8
  %27 = fdiv double %24, %26
  store double %27, double* %4, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1946, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %indvars.iv3858
  br i1 %exitcond24, label %._crit_edge40.preheader, label %.lr.ph48

.lr.ph57:                                         ; preds = %.lr.ph57.preheader, %._crit_edge40
  %indvars.iv3255 = phi i64 [ %indvars.iv.next33, %._crit_edge40 ], [ %indvars.iv3255.ph, %.lr.ph57.preheader ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 %indvars.iv3255
  br i1 %cond, label %._crit_edge40, label %.lr.ph52

.lr.ph52:                                         ; preds = %.lr.ph57
  %.pre62 = load double, double* %28, align 8
  br i1 %lcmp.mod65, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph52
  br label %29

; <label>:29:                                     ; preds = %.prol.preheader
  %30 = load double, double* %2, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3255
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %.pre62, %33
  store double %34, double* %28, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph52, %29
  %.unr66.ph = phi double [ %34, %29 ], [ %.pre62, %.lr.ph52 ]
  %indvars.iv2550.unr.ph = phi i64 [ 1, %29 ], [ 0, %.lr.ph52 ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %3, label %._crit_edge40.loopexit, label %.lr.ph52.new

.lr.ph52.new:                                     ; preds = %.prol.loopexit
  br label %35

; <label>:35:                                     ; preds = %35, %.lr.ph52.new
  %36 = phi double [ %.unr66.ph, %.lr.ph52.new ], [ %48, %35 ]
  %indvars.iv2550 = phi i64 [ %indvars.iv2550.unr.ph, %.lr.ph52.new ], [ %indvars.iv.next26.1, %35 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 %indvars.iv2550
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2550, i64 %indvars.iv3255
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  store double %42, double* %28, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2550, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3858, i64 %indvars.iv.next26
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next26, i64 %indvars.iv3255
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %28, align 8
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv2550, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv3858
  br i1 %exitcond29.1, label %._crit_edge40.loopexit.unr-lcssa, label %35

._crit_edge40.loopexit.unr-lcssa:                 ; preds = %35
  br label %._crit_edge40.loopexit

._crit_edge40.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge40.loopexit.unr-lcssa
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %.lr.ph57
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3255, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond37, label %.loopexit.loopexit, label %.lr.ph57

.loopexit.loopexit:                               ; preds = %._crit_edge40
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge40.preheader
  %indvars.iv3859 = phi i64 [ 2000, %._crit_edge40.preheader ], [ %indvars.iv3858, %.loopexit.loopexit ]
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3859, 1
  %49 = icmp slt i64 %indvars.iv.next39, 2000
  br i1 %49, label %._crit_edge.preheader, label %.loopexit63

.loopexit63:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph13:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph13, %.loopexit
  %indvars.iv410 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next5, %.loopexit ]
  %5 = mul nuw nsw i64 %indvars.iv410, 2000
  br label %6

; <label>:6:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv7
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv410, i64 %indvars.iv7
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %.loopexit, label %6

.loopexit:                                        ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond16 = icmp ne i64 %indvars.iv.next5, 2000
  br i1 %exitcond16, label %.lr.ph, label %.loopexit15

.loopexit15:                                      ; preds = %.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!13, !10}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}
!25 = distinct !{!25, !4, !5}

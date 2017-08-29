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
  br i1 true, label %._crit_edge.preheader.lr.ph, label %._crit_edge39.thread

._crit_edge39.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge12._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %2
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %._crit_edge8._crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv78 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next79, %._crit_edge8._crit_edge ]
  %4 = shl i64 %indvars.iv78, 32
  %sext = add nuw nsw i64 %4, 4294967296
  %5 = sub nsw i64 1998, %indvars.iv78
  br label %._crit_edge

._crit_edge8.preheader:                           ; preds = %._crit_edge
  %6 = ashr exact i64 %sext, 32
  %7 = shl i64 %5, 3
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %6
  %8 = and i64 %7, 34359738360
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %9 = icmp slt i64 %indvars.iv.next79, 2000
  br i1 %9, label %._crit_edge8._crit_edge.loopexit, label %._crit_edge8._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph34
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge ], [ 0, %.lr.ph34 ]
  %10 = sub nsw i64 0, %indvars.iv61
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv61
  store double %15, double* %16, align 8
  %exitcond68 = icmp eq i64 %indvars.iv61, %indvars.iv78
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  br i1 %exitcond68, label %._crit_edge8.preheader, label %._crit_edge

._crit_edge8._crit_edge.loopexit:                 ; preds = %._crit_edge8.preheader
  %17 = add nuw nsw i64 %8, 8
  %scevgep7475 = bitcast double* %scevgep74 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7475, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge8._crit_edge

._crit_edge8._crit_edge:                          ; preds = %._crit_edge8.preheader, %._crit_edge8._crit_edge.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv78
  store double 1.000000e+00, double* %18, align 8
  %exitcond88 = icmp eq i64 %indvars.iv.next79, 2000
  br i1 %exitcond88, label %._crit_edge39, label %.lr.ph34

._crit_edge39:                                    ; preds = %._crit_edge8._crit_edge
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge9._crit_edge.us.prol.loopexit, label %._crit_edge9._crit_edge.us.prol.preheader

._crit_edge9._crit_edge.us.prol.preheader:        ; preds = %._crit_edge39
  br label %._crit_edge9._crit_edge.us.prol

._crit_edge9._crit_edge.us.prol:                  ; preds = %._crit_edge9._crit_edge.us.prol, %._crit_edge9._crit_edge.us.prol.preheader
  %indvars.iv59.prol = phi i64 [ 0, %._crit_edge9._crit_edge.us.prol.preheader ], [ %indvars.iv.next60.prol, %._crit_edge9._crit_edge.us.prol ]
  %prol.iter138 = phi i64 [ 0, %._crit_edge9._crit_edge.us.prol.preheader ], [ %prol.iter138.sub, %._crit_edge9._crit_edge.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv59.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.prol, 1
  %prol.iter138.sub = add nsw i64 %prol.iter138, -1
  %prol.iter138.cmp = icmp eq i64 %prol.iter138.sub, 0
  br i1 %prol.iter138.cmp, label %._crit_edge9._crit_edge.us.prol.loopexit.unr-lcssa, label %._crit_edge9._crit_edge.us.prol, !llvm.loop !1

._crit_edge9._crit_edge.us.prol.loopexit.unr-lcssa: ; preds = %._crit_edge9._crit_edge.us.prol
  br label %._crit_edge9._crit_edge.us.prol.loopexit

._crit_edge9._crit_edge.us.prol.loopexit:         ; preds = %._crit_edge39, %._crit_edge9._crit_edge.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge11.preheader.lr.ph, label %._crit_edge39.new

._crit_edge39.new:                                ; preds = %._crit_edge9._crit_edge.us.prol.loopexit
  br label %._crit_edge9._crit_edge.us

._crit_edge9._crit_edge.us:                       ; preds = %._crit_edge9._crit_edge.us, %._crit_edge39.new
  %indvars.iv59 = phi i64 [ 0, %._crit_edge39.new ], [ %indvars.iv.next60.7, %._crit_edge9._crit_edge.us ]
  %22 = mul nuw nsw i64 %indvars.iv59, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv59, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv59, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv59, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv59, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv59, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv59, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv59, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next60.7 = add nsw i64 %indvars.iv59, 8
  %exitcond87.7 = icmp eq i64 %indvars.iv.next60.7, 2000
  br i1 %exitcond87.7, label %._crit_edge11.preheader.lr.ph.unr-lcssa, label %._crit_edge9._crit_edge.us

._crit_edge11.preheader.lr.ph.unr-lcssa:          ; preds = %._crit_edge9._crit_edge.us
  br label %._crit_edge11.preheader.lr.ph

._crit_edge11.preheader.lr.ph:                    ; preds = %._crit_edge9._crit_edge.us.prol.loopexit, %._crit_edge11.preheader.lr.ph.unr-lcssa
  br label %._crit_edge13.preheader.us.us.preheader

._crit_edge13.preheader.us.us.preheader:          ; preds = %._crit_edge11._crit_edge.us, %._crit_edge11.preheader.lr.ph
  %indvars.iv53 = phi i64 [ 0, %._crit_edge11.preheader.lr.ph ], [ %indvars.iv.next54, %._crit_edge11._crit_edge.us ]
  %scevgep91 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv53
  %scevgep9192 = bitcast double* %scevgep91 to i8*
  %37 = add nuw nsw i64 %indvars.iv53, 1
  %scevgep93 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %37
  %scevgep9394 = bitcast double* %scevgep93 to i8*
  br label %._crit_edge13.preheader.us.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge13._crit_edge.us.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond86, label %._crit_edge14.preheader.us.preheader, label %._crit_edge13.preheader.us.us.preheader

._crit_edge13.preheader.us.us:                    ; preds = %._crit_edge13._crit_edge.us.us, %._crit_edge13.preheader.us.us.preheader
  %indvars.iv51 = phi i64 [ 0, %._crit_edge13.preheader.us.us.preheader ], [ %indvars.iv.next52, %._crit_edge13._crit_edge.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv51, 16000
  %scevgep89 = getelementptr i8, i8* %19, i64 %38
  %39 = add i64 16000, %38
  %scevgep90 = getelementptr i8, i8* %19, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv53
  br i1 false, label %._crit_edge13.us.us.preheader, label %min.iters.checked

._crit_edge13.us.us.preheader:                    ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge13.preheader.us.us
  %indvars.iv47.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge13.preheader.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge13.us.us.prol.loopexit.unr-lcssa, label %._crit_edge13.us.us.prol.preheader

._crit_edge13.us.us.prol.preheader:               ; preds = %._crit_edge13.us.us.preheader
  br label %._crit_edge13.us.us.prol

._crit_edge13.us.us.prol:                         ; preds = %._crit_edge13.us.us.prol.preheader
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47.ph, i64 %indvars.iv53
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv51, i64 %indvars.iv47.ph
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next48.prol = or i64 %indvars.iv47.ph, 1
  br label %._crit_edge13.us.us.prol.loopexit.unr-lcssa

._crit_edge13.us.us.prol.loopexit.unr-lcssa:      ; preds = %._crit_edge13.us.us.preheader, %._crit_edge13.us.us.prol
  %indvars.iv47.unr.ph = phi i64 [ %indvars.iv.next48.prol, %._crit_edge13.us.us.prol ], [ %indvars.iv47.ph, %._crit_edge13.us.us.preheader ]
  br label %._crit_edge13.us.us.prol.loopexit

._crit_edge13.us.us.prol.loopexit:                ; preds = %._crit_edge13.us.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge13._crit_edge.us.us.loopexit, label %._crit_edge13.us.us.preheader.new

._crit_edge13.us.us.preheader.new:                ; preds = %._crit_edge13.us.us.prol.loopexit
  br label %._crit_edge13.us.us

min.iters.checked:                                ; preds = %._crit_edge13.preheader.us.us
  br i1 false, label %._crit_edge13.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep89, %scevgep9394
  %bound1 = icmp ult i8* %scevgep9192, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc95 = bitcast double* %40 to i8*
  %bound096 = icmp ult i8* %scevgep89, %bc95
  %bound197 = icmp ult i8* %bc, %scevgep90
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx = or i1 %found.conflict, %found.conflict98
  br i1 %conflict.rdx, label %._crit_edge13.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %48 = load double, double* %40, align 8, !alias.scope !3
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = insertelement <2 x double> undef, double %48, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv53
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv53
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv53
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv53
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = fmul <2 x double> %50, %65
  %69 = fmul <2 x double> %52, %67
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv51, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !8, !noalias !10
  %74 = fadd <2 x double> %wide.load, %68
  %75 = fadd <2 x double> %wide.load100, %69
  %76 = bitcast double* %70 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = bitcast double* %72 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 2000
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge13._crit_edge.us.us, label %._crit_edge13.us.us.preheader

._crit_edge13._crit_edge.us.us.loopexit.unr-lcssa: ; preds = %._crit_edge13.us.us
  br label %._crit_edge13._crit_edge.us.us.loopexit

._crit_edge13._crit_edge.us.us.loopexit:          ; preds = %._crit_edge13.us.us.prol.loopexit, %._crit_edge13._crit_edge.us.us.loopexit.unr-lcssa
  br label %._crit_edge13._crit_edge.us.us

._crit_edge13._crit_edge.us.us:                   ; preds = %._crit_edge13._crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond85, label %._crit_edge11._crit_edge.us, label %._crit_edge13.preheader.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us, %._crit_edge13.us.us.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr.ph, %._crit_edge13.us.us.preheader.new ], [ %indvars.iv.next48.1, %._crit_edge13.us.us ]
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv53
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv51, i64 %indvars.iv47
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %86 = load double, double* %40, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next48, i64 %indvars.iv53
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv51, i64 %indvars.iv.next48
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %exitcond84.1 = icmp eq i64 %indvars.iv.next48, 1999
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  br i1 %exitcond84.1, label %._crit_edge13._crit_edge.us.us.loopexit.unr-lcssa, label %._crit_edge13.us.us, !llvm.loop !14

._crit_edge14.preheader.us.preheader:             ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge14.preheader.us

._crit_edge14.preheader.us:                       ; preds = %._crit_edge14._crit_edge.us, %._crit_edge14.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %._crit_edge14.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge14._crit_edge.us ]
  %scevgep110 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %scevgep110111 = bitcast double* %scevgep110 to i8*
  %scevgep112 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 2000
  %scevgep112113 = bitcast double* %scevgep112 to i8*
  %93 = mul nuw nsw i64 %indvars.iv45, 16000
  %scevgep114 = getelementptr i8, i8* %19, i64 %93
  %94 = add i64 16000, %93
  %scevgep115 = getelementptr i8, i8* %19, i64 %94
  br i1 false, label %._crit_edge14.us.preheader, label %min.iters.checked105

min.iters.checked105:                             ; preds = %._crit_edge14.preheader.us
  br i1 false, label %._crit_edge14.us.preheader, label %vector.memcheck120

vector.memcheck120:                               ; preds = %min.iters.checked105
  %bound0116 = icmp ult i8* %scevgep110111, %scevgep115
  %bound1117 = icmp ult i8* %scevgep114, %scevgep112113
  %memcheck.conflict119 = and i1 %bound0116, %bound1117
  br i1 %memcheck.conflict119, label %._crit_edge14.us.preheader, label %vector.body101.preheader

vector.body101.preheader:                         ; preds = %vector.memcheck120
  br i1 false, label %vector.body101.prol.preheader, label %vector.body101.prol.loopexit.unr-lcssa

vector.body101.prol.preheader:                    ; preds = %vector.body101.preheader
  br label %vector.body101.prol

vector.body101.prol:                              ; preds = %vector.body101.prol.preheader
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 0
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load130.prol = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !15
  %97 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load131.prol = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !15
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load130.prol, <2 x i64>* %100, align 8, !alias.scope !18, !noalias !15
  %101 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load131.prol, <2 x i64>* %102, align 8, !alias.scope !18, !noalias !15
  br label %vector.body101.prol.loopexit.unr-lcssa

vector.body101.prol.loopexit.unr-lcssa:           ; preds = %vector.body101.preheader, %vector.body101.prol
  %index122.unr.ph = phi i64 [ 4, %vector.body101.prol ], [ 0, %vector.body101.preheader ]
  br label %vector.body101.prol.loopexit

vector.body101.prol.loopexit:                     ; preds = %vector.body101.prol.loopexit.unr-lcssa
  br i1 false, label %middle.block102, label %vector.body101.preheader.new

vector.body101.preheader.new:                     ; preds = %vector.body101.prol.loopexit
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.body101.preheader.new
  %index122 = phi i64 [ %index122.unr.ph, %vector.body101.preheader.new ], [ %index.next123.1, %vector.body101 ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %index122
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load130 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load131 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !15
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index122
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load130, <2 x i64>* %108, align 8, !alias.scope !18, !noalias !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load131, <2 x i64>* %110, align 8, !alias.scope !18, !noalias !15
  %index.next123 = add i64 %index122, 4
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %index.next123
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load130.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !15
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load131.1 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !15
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index.next123
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load130.1, <2 x i64>* %116, align 8, !alias.scope !18, !noalias !15
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load131.1, <2 x i64>* %118, align 8, !alias.scope !18, !noalias !15
  %index.next123.1 = add i64 %index122, 8
  %119 = icmp eq i64 %index.next123.1, 2000
  br i1 %119, label %middle.block102.unr-lcssa, label %vector.body101, !llvm.loop !20

middle.block102.unr-lcssa:                        ; preds = %vector.body101
  br label %middle.block102

middle.block102:                                  ; preds = %vector.body101.prol.loopexit, %middle.block102.unr-lcssa
  br i1 true, label %._crit_edge14._crit_edge.us, label %._crit_edge14.us.preheader

._crit_edge14.us.preheader:                       ; preds = %middle.block102, %vector.memcheck120, %min.iters.checked105, %._crit_edge14.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck120 ], [ 0, %min.iters.checked105 ], [ 0, %._crit_edge14.preheader.us ], [ 2000, %middle.block102 ]
  %120 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge14.us.prol.loopexit, label %._crit_edge14.us.prol.preheader

._crit_edge14.us.prol.preheader:                  ; preds = %._crit_edge14.us.preheader
  br label %._crit_edge14.us.prol

._crit_edge14.us.prol:                            ; preds = %._crit_edge14.us.prol, %._crit_edge14.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge14.us.prol ], [ %indvars.iv.ph, %._crit_edge14.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge14.us.prol ], [ 0, %._crit_edge14.us.prol.preheader ]
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.prol
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.prol
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge14.us.prol.loopexit.unr-lcssa, label %._crit_edge14.us.prol, !llvm.loop !21

._crit_edge14.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge14.us.prol
  br label %._crit_edge14.us.prol.loopexit

._crit_edge14.us.prol.loopexit:                   ; preds = %._crit_edge14.us.preheader, %._crit_edge14.us.prol.loopexit.unr-lcssa
  %126 = icmp ult i64 %120, 3
  br i1 %126, label %._crit_edge14._crit_edge.us.loopexit, label %._crit_edge14.us.preheader.new

._crit_edge14.us.preheader.new:                   ; preds = %._crit_edge14.us.prol.loopexit
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us, %._crit_edge14.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge14.us.preheader.new ], [ %indvars.iv.next.3, %._crit_edge14.us ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, 1999
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %._crit_edge14._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge14.us, !llvm.loop !22

._crit_edge14._crit_edge.us.loopexit.unr-lcssa:   ; preds = %._crit_edge14.us
  br label %._crit_edge14._crit_edge.us.loopexit

._crit_edge14._crit_edge.us.loopexit:             ; preds = %._crit_edge14.us.prol.loopexit, %._crit_edge14._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge14._crit_edge.us

._crit_edge14._crit_edge.us:                      ; preds = %._crit_edge14._crit_edge.us.loopexit, %middle.block102
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond83, label %._crit_edge12._crit_edge.loopexit, label %._crit_edge14.preheader.us

._crit_edge12._crit_edge.loopexit:                ; preds = %._crit_edge14._crit_edge.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.loopexit, %._crit_edge39.thread
  %147 = phi i8* [ %3, %._crit_edge39.thread ], [ %19, %._crit_edge12._crit_edge.loopexit ]
  tail call void @free(i8* %147) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %._crit_edge.preheader.preheader, label %._crit_edge10

._crit_edge.preheader.preheader:                  ; preds = %2
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv44 = phi i2 [ %indvars.iv.next45, %._crit_edge4._crit_edge ], [ 0, %._crit_edge.preheader.preheader ]
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge4._crit_edge ], [ 0, %._crit_edge.preheader.preheader ]
  %indvars.iv31 = phi i32 [ %indvars.iv.next32, %._crit_edge4._crit_edge ], [ -1, %._crit_edge.preheader.preheader ]
  %3 = zext i2 %indvars.iv44 to i64
  %4 = add nuw nsw i64 %indvars.iv42, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = zext i32 %indvars.iv31 to i64
  %7 = icmp sgt i64 %indvars.iv42, 0
  br i1 %7, label %._crit_edge3.preheader.preheader, label %._crit_edge4._crit_edge

._crit_edge3.preheader.preheader:                 ; preds = %._crit_edge.preheader
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 0
  br label %._crit_edge3.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv42
  %.pre35 = load double, double* %9, align 8
  %xtraiter37 = and i64 %indvars.iv42, 3
  %lcmp.mod38 = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod38, label %._crit_edge4.prol.loopexit, label %._crit_edge4.prol.preheader

._crit_edge4.prol.preheader:                      ; preds = %.lr.ph8
  br label %._crit_edge4.prol

._crit_edge4.prol:                                ; preds = %._crit_edge4.prol, %._crit_edge4.prol.preheader
  %10 = phi double [ %14, %._crit_edge4.prol ], [ %.pre35, %._crit_edge4.prol.preheader ]
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %._crit_edge4.prol ], [ 0, %._crit_edge4.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge4.prol ], [ %xtraiter37, %._crit_edge4.prol.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv19.prol
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fsub double %10, %13
  store double %14, double* %9, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge4.prol.loopexit.unr-lcssa, label %._crit_edge4.prol, !llvm.loop !23

._crit_edge4.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge4.prol
  br label %._crit_edge4.prol.loopexit

._crit_edge4.prol.loopexit:                       ; preds = %.lr.ph8, %._crit_edge4.prol.loopexit.unr-lcssa
  %.unr39 = phi double [ %.pre35, %.lr.ph8 ], [ %14, %._crit_edge4.prol.loopexit.unr-lcssa ]
  %indvars.iv19.unr = phi i64 [ 0, %.lr.ph8 ], [ %3, %._crit_edge4.prol.loopexit.unr-lcssa ]
  %15 = icmp ult i64 %5, 3
  br i1 %15, label %._crit_edge4._crit_edge.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge4.prol.loopexit
  br label %._crit_edge4

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.preheader, %._crit_edge
  %indvars.iv29 = phi i32 [ %indvars.iv.next30, %._crit_edge ], [ -1, %._crit_edge3.preheader.preheader ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge ], [ 0, %._crit_edge3.preheader.preheader ]
  %16 = add nuw nsw i64 %indvars.iv17, 4294967295
  %17 = and i64 %16, 4294967295
  %18 = zext i32 %indvars.iv29 to i64
  %19 = icmp sgt i64 %indvars.iv17, 0
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv17
  %.pre = load double, double* %20, align 8
  br i1 %19, label %._crit_edge3.preheader36, label %._crit_edge

._crit_edge3.preheader36:                         ; preds = %._crit_edge3.preheader
  %21 = and i64 %16, 1
  %lcmp.mod = icmp eq i64 %21, 0
  br i1 %lcmp.mod, label %._crit_edge3.prol.preheader, label %._crit_edge3.prol.loopexit.unr-lcssa

._crit_edge3.prol.preheader:                      ; preds = %._crit_edge3.preheader36
  br label %._crit_edge3.prol

._crit_edge3.prol:                                ; preds = %._crit_edge3.prol.preheader
  %22 = load double, double* %8, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 0
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %.pre, %25
  store double %26, double* %20, align 8
  br label %._crit_edge3.prol.loopexit.unr-lcssa

._crit_edge3.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge3.preheader36, %._crit_edge3.prol
  %.lcssa.unr.ph = phi double [ %26, %._crit_edge3.prol ], [ undef, %._crit_edge3.preheader36 ]
  %.unr.ph = phi double [ %26, %._crit_edge3.prol ], [ %.pre, %._crit_edge3.preheader36 ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge3.prol ], [ 0, %._crit_edge3.preheader36 ]
  br label %._crit_edge3.prol.loopexit

._crit_edge3.prol.loopexit:                       ; preds = %._crit_edge3.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %17, 0
  br i1 %27, label %._crit_edge.loopexit, label %._crit_edge3.preheader36.new

._crit_edge3.preheader36.new:                     ; preds = %._crit_edge3.prol.loopexit
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %._crit_edge3.preheader36.new
  %28 = phi double [ %.unr.ph, %._crit_edge3.preheader36.new ], [ %40, %._crit_edge3 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge3.preheader36.new ], [ %indvars.iv.next.1, %._crit_edge3 ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %34, %39
  store double %40, double* %20, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %18
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge3

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge3
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge3.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge3.prol.loopexit ], [ %40, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge3.preheader
  %41 = phi double [ %.pre, %._crit_edge3.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv17
  %43 = load double, double* %42, align 8
  %44 = fdiv double %41, %43
  store double %44, double* %20, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %indvars.iv.next30 = add nsw i32 %indvars.iv29, 1
  %exitcond = icmp ne i64 %indvars.iv.next18, %indvars.iv42
  br i1 %exitcond, label %._crit_edge3.preheader, label %.lr.ph8

._crit_edge4:                                     ; preds = %._crit_edge4, %.lr.ph8.new
  %45 = phi double [ %.unr39, %.lr.ph8.new ], [ %61, %._crit_edge4 ]
  %indvars.iv19 = phi i64 [ %indvars.iv19.unr, %.lr.ph8.new ], [ %indvars.iv.next20.3, %._crit_edge4 ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv19
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %9, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv.next20
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %9, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv.next20.1
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %9, align 8
  %indvars.iv.next20.2 = add nsw i64 %indvars.iv19, 3
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv.next20.2
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = fsub double %57, %60
  store double %61, double* %9, align 8
  %exitcond33.3 = icmp eq i64 %indvars.iv.next20.2, %6
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  br i1 %exitcond33.3, label %._crit_edge4._crit_edge.loopexit.unr-lcssa, label %._crit_edge4

._crit_edge4._crit_edge.loopexit.unr-lcssa:       ; preds = %._crit_edge4
  br label %._crit_edge4._crit_edge.loopexit

._crit_edge4._crit_edge.loopexit:                 ; preds = %._crit_edge4.prol.loopexit, %._crit_edge4._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4._crit_edge.loopexit, %._crit_edge.preheader
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv42
  %63 = load double, double* %62, align 8
  %64 = tail call double @sqrt(double %63) #3
  store double %64, double* %62, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %indvars.iv.next32 = add nsw i32 %indvars.iv31, 1
  %indvars.iv.next45 = add i2 %indvars.iv44, 1
  %exitcond46 = icmp ne i64 %indvars.iv.next43, 2000
  br i1 %exitcond46, label %._crit_edge.preheader, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge4._crit_edge
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %._crit_edge.preheader.preheader, label %._crit_edge

._crit_edge.preheader.preheader:                  ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge._crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge._crit_edge ], [ 1, %._crit_edge.preheader.preheader ]
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge ]
  %7 = mul nsw i64 %indvars.iv5, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %exitcond9 = icmp ne i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond9, label %8, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 2000
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}

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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph60:
  br label %.lr.ph49

.lr.ph49:                                         ; preds = %.lr.ph49.backedge, %.lr.ph60
  %indvars.iv105 = phi i64 [ 0, %.lr.ph60 ], [ %indvars.iv.next106, %.lr.ph49.backedge ]
  %1 = shl i64 %indvars.iv105, 32
  %sext = add nuw nsw i64 %1, 4294967296
  %2 = sub nsw i64 1998, %indvars.iv105
  %3 = shl i64 %2, 3
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph49
  %indvars.iv92 = phi i64 [ 0, %.lr.ph49 ], [ %indvars.iv.next93, %4 ]
  %5 = sub nsw i64 0, %indvars.iv92
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv92
  store double %10, double* %11, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond96 = icmp eq i64 %indvars.iv92, %indvars.iv105
  br i1 %exitcond96, label %._crit_edge50, label %4

._crit_edge50:                                    ; preds = %4
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %12 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %12, label %._crit_edge56.thread, label %._crit_edge56

._crit_edge56.thread:                             ; preds = %._crit_edge50
  %13 = and i64 %3, 34359738360
  %14 = ashr exact i64 %sext, 32
  %15 = add nuw nsw i64 %13, 8
  %scevgep103 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %14
  %16 = bitcast double* %scevgep103 to i8*
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %15, i32 8, i1 false)
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %17, align 8
  br label %.lr.ph49.backedge

.lr.ph49.backedge:                                ; preds = %._crit_edge56.thread, %._crit_edge56
  br label %.lr.ph49

._crit_edge56:                                    ; preds = %._crit_edge50
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %18, align 8
  %exitcond5 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond5, label %.lr.ph42.split.us.preheader, label %.lr.ph49.backedge

.lr.ph42.split.us.preheader:                      ; preds = %._crit_edge56
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us, %.lr.ph42.split.us.preheader
  %indvars.iv90 = phi i64 [ 0, %.lr.ph42.split.us.preheader ], [ %indvars.iv.next91.7, %._crit_edge38.us ]
  %20 = mul nuw nsw i64 %indvars.iv90, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91 = or i64 %indvars.iv90, 1
  %21 = mul nuw nsw i64 %indvars.iv.next91, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.1 = or i64 %indvars.iv90, 2
  %22 = mul nuw nsw i64 %indvars.iv.next91.1, 16000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.2 = or i64 %indvars.iv90, 3
  %23 = mul nuw nsw i64 %indvars.iv.next91.2, 16000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.3 = or i64 %indvars.iv90, 4
  %24 = mul nuw nsw i64 %indvars.iv.next91.3, 16000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.4 = or i64 %indvars.iv90, 5
  %25 = mul nuw nsw i64 %indvars.iv.next91.4, 16000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.5 = or i64 %indvars.iv90, 6
  %26 = mul nuw nsw i64 %indvars.iv.next91.5, 16000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.6 = or i64 %indvars.iv90, 7
  %27 = mul nuw nsw i64 %indvars.iv.next91.6, 16000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.7 = add nsw i64 %indvars.iv90, 8
  %exitcond4.7 = icmp eq i64 %indvars.iv.next91.7, 2000
  br i1 %exitcond4.7, label %.lr.ph11.us.us.preheader.preheader, label %._crit_edge38.us

.lr.ph11.us.us.preheader.preheader:               ; preds = %._crit_edge38.us
  %28 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %30 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.lr.ph11.us.us.preheader

.lr.ph11.us.us.preheader:                         ; preds = %.lr.ph11.us.us.preheader.preheader, %._crit_edge16.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge16.us ], [ 0, %.lr.ph11.us.us.preheader.preheader ]
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv85
  %31 = add nuw nsw i64 %indvars.iv85, 1
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %31
  %32 = bitcast double* %scevgep11 to i8*
  %33 = bitcast double* %scevgep9 to i8*
  br label %.lr.ph11.us.us

._crit_edge16.us:                                 ; preds = %._crit_edge12.us.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond3, label %.lr.ph6.split.us.preheader, label %.lr.ph11.us.us.preheader

.lr.ph6.split.us.preheader:                       ; preds = %._crit_edge16.us
  %34 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %40 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.lr.ph6.split.us

.lr.ph11.us.us:                                   ; preds = %._crit_edge12.us.us, %.lr.ph11.us.us.preheader
  %indvars.iv83 = phi i64 [ 0, %.lr.ph11.us.us.preheader ], [ %indvars.iv.next84, %._crit_edge12.us.us ]
  %41 = mul nuw nsw i64 %indvars.iv83, 16000
  %scevgep7 = getelementptr i8, i8* %19, i64 %41
  %42 = add nuw nsw i64 %41, 16000
  %scevgep8 = getelementptr i8, i8* %19, i64 %42
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv85
  %bound0 = icmp ult i8* %scevgep7, %32
  %bound1 = icmp ult i8* %33, %scevgep8
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %43 to i8*
  %bc13 = bitcast double* %43 to i8*
  %bound014 = icmp ult i8* %scevgep7, %bc13
  %bound115 = icmp ult i8* %bc, %scevgep8
  %found.conflict16 = and i1 %bound014, %bound115
  %conflict.rdx = or i1 %found.conflict, %found.conflict16
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph11.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph11.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %44 = or i64 %index, 1
  %45 = or i64 %index, 2
  %46 = or i64 %index, 3
  %47 = load double, double* %43, align 8, !alias.scope !1
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = insertelement <2 x double> undef, double %47, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv85
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv85
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %45, i64 %indvars.iv85
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %46, i64 %indvars.iv85
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = load double, double* %54, align 8, !alias.scope !4
  %59 = load double, double* %55, align 8, !alias.scope !4
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = fmul <2 x double> %49, %61
  %65 = fmul <2 x double> %51, %63
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv83, i64 %index
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = fadd <2 x double> %64, %wide.load
  %71 = fadd <2 x double> %65, %wide.load18
  %72 = bitcast double* %66 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8, !alias.scope !6, !noalias !8
  %73 = bitcast double* %68 to <2 x double>*
  store <2 x double> %71, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %74 = icmp eq i64 %index.next, 2000
  br i1 %74, label %._crit_edge12.us.us.loopexit49, label %vector.body, !llvm.loop !9

._crit_edge12.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge12.us.us

._crit_edge12.us.us.loopexit49:                   ; preds = %vector.body
  br label %._crit_edge12.us.us

._crit_edge12.us.us:                              ; preds = %._crit_edge12.us.us.loopexit49, %._crit_edge12.us.us.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond2, label %._crit_edge16.us, label %.lr.ph11.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv80 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next81.1, %scalar.ph ]
  %75 = load double, double* %43, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv85
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv83, i64 %indvars.iv80
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  store double %81, double* %79, align 8
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %82 = load double, double* %43, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next81, i64 %indvars.iv85
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next81
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  store double %88, double* %86, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next81, 1999
  br i1 %exitcond82.1, label %._crit_edge12.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %89 = add nuw nsw i64 %indvars.iv78, 1
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %0, i64 %89, i64 0
  %scevgep2627 = bitcast double* %scevgep26 to i8*
  %90 = mul nuw nsw i64 %indvars.iv78, 16000
  %scevgep28 = getelementptr i8, i8* %19, i64 %90
  %91 = add nuw nsw i64 %90, 16000
  %scevgep29 = getelementptr i8, i8* %19, i64 %91
  %bound030 = icmp ult i8* %scevgep2425, %scevgep29
  %bound131 = icmp ult i8* %scevgep28, %scevgep2627
  %memcheck.conflict33 = and i1 %bound030, %bound131
  br i1 %memcheck.conflict33, label %scalar.ph21.preheader, label %vector.body19.preheader

vector.body19.preheader:                          ; preds = %.lr.ph6.split.us
  br label %vector.body19

scalar.ph21.preheader:                            ; preds = %.lr.ph6.split.us
  br label %scalar.ph21

vector.body19:                                    ; preds = %vector.body19, %vector.body19.preheader
  %index36 = phi i64 [ 0, %vector.body19.preheader ], [ %index.next37.1, %vector.body19 ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv78, i64 %index36
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load44 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load45 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !13
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %index36
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load44, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load45, <2 x i64>* %99, align 8, !alias.scope !16, !noalias !13
  %index.next37 = or i64 %index36, 4
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv78, i64 %index.next37
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load45.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %index.next37
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load44.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load45.1, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next37.1 = add nsw i64 %index36, 8
  %108 = icmp eq i64 %index.next37.1, 2000
  br i1 %108, label %._crit_edge.us.loopexit48, label %vector.body19, !llvm.loop !18

scalar.ph21:                                      ; preds = %scalar.ph21, %scalar.ph21.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph21.preheader ], [ %indvars.iv.next.4, %scalar.ph21 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv78, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv.next.3
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph21, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph21
  br label %._crit_edge.us

._crit_edge.us.loopexit48:                        ; preds = %vector.body19
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit48, %._crit_edge.us.loopexit
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next79, 2000
  br i1 %exitcond1, label %134, label %.lr.ph6.split.us

; <label>:134:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %19) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph18:
  br label %1

; <label>:1:                                      ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge13 ], [ 4294967295, %.lr.ph18 ]
  %2 = and i64 %indvars.iv4, 4294967295
  %3 = icmp sgt i64 %indvars.iv7, 0
  br i1 %3, label %.lr.ph3.preheader, label %._crit_edge13

.lr.ph3.preheader:                                ; preds = %1
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 0
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %._crit_edge, %.lr.ph3.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 4294967295, %.lr.ph3.preheader ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge ], [ 0, %.lr.ph3.preheader ]
  %5 = and i64 %indvars.iv1, 4294967295
  %6 = icmp sgt i64 %indvars.iv40, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv40
  %.pre = load double, double* %7, align 8
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph3
  %8 = and i64 %indvars.iv1, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %9 = load double, double* %4, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv40
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre, %12
  store double %13, double* %7, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %13, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %13, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %14 = icmp eq i64 %5, 0
  br i1 %14, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %15 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %27, %.lr.ph ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv40
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv40
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next, %5
  br i1 %exitcond3.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %27, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph3
  %28 = phi double [ %.pre, %.lr.ph3 ], [ %.lcssa, %._crit_edge.loopexit ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv40
  %30 = load double, double* %29, align 8
  %31 = fdiv double %28, %30
  store double %31, double* %7, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %indvars.iv.next2 = add nuw nsw i64 %5, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next41, %indvars.iv7
  br i1 %exitcond9, label %.lr.ph12.split.us.preheader, label %.lr.ph3

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge
  %32 = and i64 %indvars.iv4, 1
  %lcmp.mod12 = icmp eq i64 %32, 0
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 0
  %34 = icmp eq i64 %2, 0
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %.lr.ph12.split.us.preheader, %._crit_edge9.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge9.us ], [ %indvars.iv7, %.lr.ph12.split.us.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv51
  %.pre33 = load double, double* %35, align 8
  br i1 %lcmp.mod12, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph12.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %33, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv51
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %.pre33, %40
  store double %41, double* %35, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph12.split.us, %36
  %indvars.iv43.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph12.split.us ]
  %.unr13.ph = phi double [ %41, %36 ], [ %.pre33, %.lr.ph12.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %34, label %._crit_edge9.us, label %.lr.ph12.split.us.new

.lr.ph12.split.us.new:                            ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph12.split.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.lr.ph12.split.us.new ], [ %indvars.iv.next44.1, %42 ]
  %43 = phi double [ %.unr13.ph, %.lr.ph12.split.us.new ], [ %55, %42 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv43
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv51
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %35, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv.next44
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next44, i64 %indvars.iv51
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %35, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next44, %2
  br i1 %exitcond.1, label %._crit_edge9.us.unr-lcssa, label %42

._crit_edge9.us.unr-lcssa:                        ; preds = %42
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.prol.loopexit, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond6, label %._crit_edge13.loopexit, label %.lr.ph12.split.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %indvars.iv.next5 = add nuw nsw i64 %2, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond10, label %56, label %1

; <label>:56:                                     ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph2.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond1, label %18, label %.lr.ph2.split.us

; <label>:18:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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

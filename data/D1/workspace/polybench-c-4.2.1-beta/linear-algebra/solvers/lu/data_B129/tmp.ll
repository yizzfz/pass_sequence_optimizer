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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph59:
  br label %.lr.ph46

.lr.ph46:                                         ; preds = %._crit_edge53.thread, %.lr.ph59
  %indvars.iv101 = phi i64 [ 0, %.lr.ph59 ], [ %indvars.iv.next102, %._crit_edge53.thread ]
  %1 = sub i64 1998, %indvars.iv101
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph46
  %indvars.iv89 = phi i64 [ 0, %.lr.ph46 ], [ %indvars.iv.next90, %4 ]
  %5 = sub nsw i64 0, %indvars.iv89
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv89
  store double %10, double* %11, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond93 = icmp eq i64 %indvars.iv89, %indvars.iv101
  br i1 %exitcond93, label %._crit_edge47, label %4

._crit_edge47:                                    ; preds = %4
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %12 = icmp slt i64 %indvars.iv.next102, 2000
  br i1 %12, label %._crit_edge53.thread, label %.lr.ph39.split.us.preheader

._crit_edge53.thread:                             ; preds = %._crit_edge47
  %13 = add nuw nsw i64 %3, 8
  %scevgep99 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv.next102
  %scevgep99100 = bitcast double* %scevgep99 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep99100, i8 0, i64 %13, i32 8, i1 false)
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv101
  store double 1.000000e+00, double* %14, align 8
  br label %.lr.ph46

.lr.ph39.split.us.preheader:                      ; preds = %._crit_edge47
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv101
  store double 1.000000e+00, double* %15, align 8
  %16 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us, %.lr.ph39.split.us.preheader
  %indvars.iv87 = phi i64 [ 0, %.lr.ph39.split.us.preheader ], [ %indvars.iv.next88.7, %._crit_edge35.us ]
  %17 = mul nuw nsw i64 %indvars.iv87, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88 = or i64 %indvars.iv87, 1
  %18 = mul nuw nsw i64 %indvars.iv.next88, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.1 = or i64 %indvars.iv87, 2
  %19 = mul nuw nsw i64 %indvars.iv.next88.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.2 = or i64 %indvars.iv87, 3
  %20 = mul nuw nsw i64 %indvars.iv.next88.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.3 = or i64 %indvars.iv87, 4
  %21 = mul nuw nsw i64 %indvars.iv.next88.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.4 = or i64 %indvars.iv87, 5
  %22 = mul nuw nsw i64 %indvars.iv.next88.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.5 = or i64 %indvars.iv87, 6
  %23 = mul nuw nsw i64 %indvars.iv.next88.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.6 = or i64 %indvars.iv87, 7
  %24 = mul nuw nsw i64 %indvars.iv.next88.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next88.7 = add nsw i64 %indvars.iv87, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next88.7, 2000
  br i1 %exitcond45.7, label %.lr.ph13.us.us.preheader.preheader, label %._crit_edge35.us

.lr.ph13.us.us.preheader.preheader:               ; preds = %._crit_edge35.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.lr.ph13.us.us.preheader

.lr.ph13.us.us.preheader:                         ; preds = %._crit_edge17.us, %.lr.ph13.us.us.preheader.preheader
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge17.us ], [ 0, %.lr.ph13.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv82
  %28 = add nuw nsw i64 %indvars.iv82, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep5 to i8*
  %30 = bitcast double* %scevgep3 to i8*
  br label %.lr.ph13.us.us

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next83, 2000
  br i1 %exitcond44, label %.lr.ph8.split.us.preheader, label %.lr.ph13.us.us.preheader

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge17.us
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.lr.ph8.split.us

.lr.ph13.us.us:                                   ; preds = %._crit_edge14.us.us, %.lr.ph13.us.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph13.us.us.preheader ], [ %indvars.iv.next81, %._crit_edge14.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv80, 16000
  %scevgep1 = getelementptr i8, i8* %16, i64 %38
  %39 = add nuw nsw i64 %38, 16000
  %scevgep2 = getelementptr i8, i8* %16, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv82
  %bound0 = icmp ult i8* %scevgep1, %29
  %bound1 = icmp ult i8* %30, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc7 = bitcast double* %40 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph13.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph13.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %40, align 8, !alias.scope !1
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = insertelement <2 x double> undef, double %44, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv82
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv82
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv82
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv82
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = insertelement <2 x double> undef, double %55, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fmul <2 x double> %46, %58
  %62 = fmul <2 x double> %48, %60
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv80, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %67 = fadd <2 x double> %wide.load, %61
  %68 = fadd <2 x double> %wide.load12, %62
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %71 = icmp eq i64 %index.next, 2000
  br i1 %71, label %._crit_edge14.us.us.loopexit47, label %vector.body, !llvm.loop !9

._crit_edge14.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge14.us.us

._crit_edge14.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit47, %._crit_edge14.us.us.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond43, label %._crit_edge17.us, label %.lr.ph13.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv77 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next78.1, %scalar.ph ]
  %72 = load double, double* %40, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv77, i64 %indvars.iv82
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv80, i64 %indvars.iv77
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %75
  store double %78, double* %76, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next78, i64 %indvars.iv82
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv80, i64 %indvars.iv.next78
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next78, 1999
  br i1 %exitcond79.1, label %._crit_edge14.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %86 = add nuw nsw i64 %indvars.iv75, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %86, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %87 = mul nuw nsw i64 %indvars.iv75, 16000
  %scevgep22 = getelementptr i8, i8* %16, i64 %87
  %88 = add nuw nsw i64 %87, 16000
  %scevgep23 = getelementptr i8, i8* %16, i64 %88
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.lr.ph8.split.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.lr.ph8.split.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv75, i64 %index30
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %index30
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv75, i64 %index.next31
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %index.next31
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %105 = icmp eq i64 %index.next31.1, 2000
  br i1 %105, label %._crit_edge.us.loopexit46, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond42, label %131, label %.lr.ph8.split.us

; <label>:131:                                    ; preds = %._crit_edge.us
  call void @free(i8* nonnull %16) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph18:
  br label %1

; <label>:1:                                      ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv45 = phi i32 [ %indvars.iv.next46, %._crit_edge13 ], [ -1, %.lr.ph18 ]
  %2 = add i64 %indvars.iv1, 4294967295
  %3 = and i64 %2, 4294967295
  %4 = icmp sgt i64 %indvars.iv1, 0
  br i1 %4, label %.lr.ph3.preheader, label %._crit_edge13

.lr.ph3.preheader:                                ; preds = %1
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %._crit_edge, %.lr.ph3.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge ], [ 0, %.lr.ph3.preheader ]
  %indvars.iv38 = phi i32 [ %indvars.iv.next39, %._crit_edge ], [ -1, %.lr.ph3.preheader ]
  %6 = add i64 %indvars.iv40, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = icmp sgt i64 %indvars.iv40, 0
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv40
  %.pre = load double, double* %9, align 8
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3
  %wide.trip.count = zext i32 %indvars.iv38 to i64
  %10 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %11

; <label>:11:                                     ; preds = %.prol.preheader
  %12 = load double, double* %5, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv40
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre, %15
  store double %16, double* %9, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %11
  %.lcssa.unr.ph = phi double [ %16, %11 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %11 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %16, %11 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %7, 0
  br i1 %17, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %18

; <label>:18:                                     ; preds = %18, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %18 ]
  %19 = phi double [ %.unr.ph, %.lr.ph.new ], [ %31, %18 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv40
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv40
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %18

._crit_edge.loopexit.unr-lcssa:                   ; preds = %18
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %31, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph3
  %32 = phi double [ %.pre, %.lr.ph3 ], [ %.lcssa, %._crit_edge.loopexit ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv40
  %34 = load double, double* %33, align 8
  %35 = fdiv double %32, %34
  store double %35, double* %9, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %indvars.iv.next39 = add nsw i32 %indvars.iv38, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next41, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph12.split.us.preheader, label %.lr.ph3

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge
  %wide.trip.count47 = zext i32 %indvars.iv45 to i64
  %36 = and i64 %2, 1
  %lcmp.mod9 = icmp eq i64 %36, 0
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %38 = icmp eq i64 %3, 0
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge9.us, %.lr.ph12.split.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge9.us ], [ %indvars.iv1, %.lr.ph12.split.us.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv51
  %.pre33 = load double, double* %39, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.lr.ph12.split.us
  br label %40

; <label>:40:                                     ; preds = %.prol.preheader6
  %41 = load double, double* %37, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv51
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %.pre33, %44
  store double %45, double* %39, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.lr.ph12.split.us, %40
  %indvars.iv43.unr.ph = phi i64 [ 1, %40 ], [ 0, %.lr.ph12.split.us ]
  %.unr10.ph = phi double [ %45, %40 ], [ %.pre33, %.lr.ph12.split.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %38, label %._crit_edge9.us, label %.lr.ph12.split.us.new

.lr.ph12.split.us.new:                            ; preds = %.prol.loopexit7
  br label %46

; <label>:46:                                     ; preds = %46, %.lr.ph12.split.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.lr.ph12.split.us.new ], [ %indvars.iv.next44.1, %46 ]
  %47 = phi double [ %.unr10.ph, %.lr.ph12.split.us.new ], [ %59, %46 ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv43
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv51
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  store double %53, double* %39, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next44
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next44, i64 %indvars.iv51
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fsub double %53, %58
  store double %59, double* %39, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next44, %wide.trip.count47
  br i1 %exitcond48.1, label %._crit_edge9.us.unr-lcssa, label %46

._crit_edge9.us.unr-lcssa:                        ; preds = %46
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.prol.loopexit7, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond4, label %._crit_edge13.loopexit, label %.lr.ph12.split.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %1
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next46 = add nsw i32 %indvars.iv45, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %60, label %1

; <label>:60:                                     ; preds = %._crit_edge13
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
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond1, label %18, label %.lr.ph2.split.us

; <label>:18:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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

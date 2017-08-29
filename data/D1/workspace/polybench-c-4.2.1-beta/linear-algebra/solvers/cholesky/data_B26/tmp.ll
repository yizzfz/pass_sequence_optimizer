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
.preheader71.lr.ph:
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %.preheader71.lr.ph, %._crit_edge98..preheader71_crit_edge
  %indvars.iv147 = phi i64 [ 0, %.preheader71.lr.ph ], [ %indvars.iv.next148, %._crit_edge98..preheader71_crit_edge ]
  %indvars.iv145 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next146, %._crit_edge98..preheader71_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv147, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %4 = sub i64 1998, %indvars.iv147
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph93
  %indvars.iv129 = phi i64 [ 0, %.lr.ph93 ], [ %indvars.iv.next130, %._crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv129
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv129
  store double %12, double* %13, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next130, %indvars.iv145
  br i1 %exitcond136, label %._crit_edge94, label %._crit_edge

._crit_edge94:                                    ; preds = %._crit_edge
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  %14 = add nuw nsw i64 %6, 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %15 = icmp slt i64 %indvars.iv.next148, 2000
  br i1 %15, label %._crit_edge98.thread, label %._crit_edge98

._crit_edge98.thread:                             ; preds = %._crit_edge94
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep141142, i8 0, i64 %14, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv147
  store double 1.000000e+00, double* %16, align 8
  br label %._crit_edge98..preheader71_crit_edge

._crit_edge98:                                    ; preds = %._crit_edge94
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv147
  store double 1.000000e+00, double* %17, align 8
  %exitcond150 = icmp eq i64 %indvars.iv.next148, 2000
  br i1 %exitcond150, label %.preheader70.us.preheader, label %._crit_edge98..preheader71_crit_edge

._crit_edge98..preheader71_crit_edge:             ; preds = %._crit_edge98.thread, %._crit_edge98
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  br label %.lr.ph93

.preheader70.us.preheader:                        ; preds = %._crit_edge98
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us, %.preheader70.us.preheader
  %indvars.iv125 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next126.7, %._crit_edge90.us ]
  %19 = mul nuw nsw i64 %indvars.iv125, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126 = or i64 %indvars.iv125, 1
  %20 = mul nuw nsw i64 %indvars.iv.next126, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.1 = or i64 %indvars.iv125, 2
  %21 = mul nuw nsw i64 %indvars.iv.next126.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.2 = or i64 %indvars.iv125, 3
  %22 = mul nuw nsw i64 %indvars.iv.next126.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.3 = or i64 %indvars.iv125, 4
  %23 = mul nuw nsw i64 %indvars.iv.next126.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.4 = or i64 %indvars.iv125, 5
  %24 = mul nuw nsw i64 %indvars.iv.next126.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.5 = or i64 %indvars.iv125, 6
  %25 = mul nuw nsw i64 %indvars.iv.next126.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.6 = or i64 %indvars.iv125, 7
  %26 = mul nuw nsw i64 %indvars.iv.next126.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.7 = add nuw nsw i64 %indvars.iv125, 8
  %exitcond128.7 = icmp eq i64 %indvars.iv.next126.7, 2000
  br i1 %exitcond128.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge90.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge90.us
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %.preheader67.us.us.preheader.preheader, %._crit_edge79.us
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge79.us ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv117
  %scevgep156157 = bitcast double* %scevgep156 to i8*
  %28 = add nuw nsw i64 %indvars.iv117, 1
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %28
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  br label %.preheader67.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond120, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge79.us
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge77.us.us, %.preheader67.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next114, %._crit_edge77.us.us ]
  %29 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep154 = getelementptr i8, i8* %18, i64 %29
  %30 = add nuw nsw i64 %29, 16000
  %scevgep155 = getelementptr i8, i8* %18, i64 %30
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv117
  %bound0 = icmp ult i8* %scevgep154, %scevgep158159
  %bound1 = icmp ult i8* %scevgep156157, %scevgep155
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %31 to i8*
  %bc160 = bitcast double* %31 to i8*
  %bound0161 = icmp ult i8* %scevgep154, %bc160
  %bound1162 = icmp ult i8* %bc, %scevgep155
  %found.conflict163 = and i1 %bound0161, %bound1162
  %conflict.rdx = or i1 %found.conflict, %found.conflict163
  br i1 %conflict.rdx, label %._crit_edge151.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  %32 = load double, double* %31, align 8, !alias.scope !1
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = insertelement <2 x double> undef, double %32, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

._crit_edge151.preheader:                         ; preds = %.preheader67.us.us
  br label %._crit_edge151

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = or i64 %index, 1
  %38 = or i64 %index, 2
  %39 = or i64 %index, 3
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv117
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %37, i64 %indvars.iv117
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %38, i64 %indvars.iv117
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %39, i64 %indvars.iv117
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = load double, double* %43, align 8, !alias.scope !4
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %47, i32 1
  %52 = fmul <2 x double> %34, %49
  %53 = fmul <2 x double> %36, %51
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv113, i64 %index
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %58 = fadd <2 x double> %wide.load, %52
  %59 = fadd <2 x double> %wide.load165, %53
  %60 = bitcast double* %54 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %61 = bitcast double* %56 to <2 x double>*
  store <2 x double> %59, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %62 = icmp eq i64 %index.next, 2000
  br i1 %62, label %._crit_edge77.us.us.loopexit194, label %vector.body, !llvm.loop !9

._crit_edge77.us.us.loopexit:                     ; preds = %._crit_edge151
  br label %._crit_edge77.us.us

._crit_edge77.us.us.loopexit194:                  ; preds = %vector.body
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit194, %._crit_edge77.us.us.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond116, label %._crit_edge79.us, label %.preheader67.us.us

._crit_edge151:                                   ; preds = %._crit_edge151, %._crit_edge151.preheader
  %indvars.iv109 = phi i64 [ 0, %._crit_edge151.preheader ], [ %indvars.iv.next110.1, %._crit_edge151 ]
  %63 = load double, double* %31, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv117
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv113, i64 %indvars.iv109
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %70 = load double, double* %31, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next110, i64 %indvars.iv117
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next110
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %indvars.iv.next110.1 = add nuw nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond112.1, label %._crit_edge77.us.us.loopexit, label %._crit_edge151, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 0
  %scevgep171172 = bitcast double* %scevgep171 to i8*
  %77 = add nuw nsw i64 %indvars.iv105, 1
  %scevgep173 = getelementptr [2000 x double], [2000 x double]* %1, i64 %77, i64 0
  %scevgep173174 = bitcast double* %scevgep173 to i8*
  %78 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep175 = getelementptr i8, i8* %18, i64 %78
  %79 = add nuw nsw i64 %78, 16000
  %scevgep176 = getelementptr i8, i8* %18, i64 %79
  %bound0177 = icmp ult i8* %scevgep171172, %scevgep176
  %bound1178 = icmp ult i8* %scevgep175, %scevgep173174
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %._crit_edge152.preheader, label %vector.body166.preheader

vector.body166.preheader:                         ; preds = %.preheader.us
  br label %vector.body166

._crit_edge152.preheader:                         ; preds = %.preheader.us
  br label %._crit_edge152

vector.body166:                                   ; preds = %vector.body166, %vector.body166.preheader
  %index183 = phi i64 [ 0, %vector.body166.preheader ], [ %index.next184.1, %vector.body166 ]
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %index183
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !13
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %index183
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %85, align 8, !alias.scope !16, !noalias !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %87, align 8, !alias.scope !16, !noalias !13
  %index.next184 = or i64 %index183, 4
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %index.next184
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load192.1 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %index.next184
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %93, align 8, !alias.scope !16, !noalias !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load192.1, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %index.next184.1 = add nuw nsw i64 %index183, 8
  %96 = icmp eq i64 %index.next184.1, 2000
  br i1 %96, label %._crit_edge.us.loopexit193, label %vector.body166, !llvm.loop !18

._crit_edge152:                                   ; preds = %._crit_edge152, %._crit_edge152.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge152.preheader ], [ %indvars.iv.next.4, %._crit_edge152 ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.3
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.3
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond104.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond104.4, label %._crit_edge.us.loopexit, label %._crit_edge152, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %._crit_edge152
  br label %._crit_edge.us

._crit_edge.us.loopexit193:                       ; preds = %vector.body166
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit193, %._crit_edge.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond108, label %._crit_edge74, label %.preheader.us

._crit_edge74:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader41.preheader:
  br label %.preheader41

.preheader41:                                     ; preds = %._crit_edge46, %.preheader41.preheader
  %indvars.iv84 = phi i2 [ %indvars.iv.next85, %._crit_edge46 ], [ 0, %.preheader41.preheader ]
  %indvars.iv71 = phi i64 [ 0, %.preheader41.preheader ], [ %indvars.iv.next72, %._crit_edge46 ]
  %2 = zext i2 %indvars.iv84 to i64
  %3 = add nsw i64 %indvars.iv71, -1
  %4 = icmp sgt i64 %indvars.iv71, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge46

.preheader.preheader:                             ; preds = %.preheader41
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 0
  br label %.preheader

.lr.ph45:                                         ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv71
  %.pre78 = load double, double* %6, align 8
  %xtraiter79 = and i64 %indvars.iv71, 3
  %lcmp.mod80 = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod80, label %._crit_edge76.prol.loopexit, label %._crit_edge76.prol.preheader

._crit_edge76.prol.preheader:                     ; preds = %.lr.ph45
  br label %._crit_edge76.prol

._crit_edge76.prol:                               ; preds = %._crit_edge76.prol, %._crit_edge76.prol.preheader
  %7 = phi double [ %.pre78, %._crit_edge76.prol.preheader ], [ %11, %._crit_edge76.prol ]
  %indvars.iv63.prol = phi i64 [ 0, %._crit_edge76.prol.preheader ], [ %indvars.iv.next64.prol, %._crit_edge76.prol ]
  %prol.iter = phi i64 [ %xtraiter79, %._crit_edge76.prol.preheader ], [ %prol.iter.sub, %._crit_edge76.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv63.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge76.prol.loopexit.unr-lcssa, label %._crit_edge76.prol, !llvm.loop !20

._crit_edge76.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge76.prol
  br label %._crit_edge76.prol.loopexit

._crit_edge76.prol.loopexit:                      ; preds = %.lr.ph45, %._crit_edge76.prol.loopexit.unr-lcssa
  %.unr81 = phi double [ %.pre78, %.lr.ph45 ], [ %11, %._crit_edge76.prol.loopexit.unr-lcssa ]
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph45 ], [ %2, %._crit_edge76.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %3, 3
  br i1 %12, label %._crit_edge46.loopexit, label %.lr.ph45.new

.lr.ph45.new:                                     ; preds = %._crit_edge76.prol.loopexit
  br label %._crit_edge76

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv55, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv55
  %.pre = load double, double* %14, align 8
  br i1 %13, label %._crit_edge75.preheader, label %._crit_edge

._crit_edge75.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv55, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge75.prol.loopexit.unr-lcssa, label %._crit_edge75.prol.preheader

._crit_edge75.prol.preheader:                     ; preds = %._crit_edge75.preheader
  br label %._crit_edge75.prol

._crit_edge75.prol:                               ; preds = %._crit_edge75.prol.preheader
  %15 = load double, double* %5, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %._crit_edge75.prol.loopexit.unr-lcssa

._crit_edge75.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge75.preheader, %._crit_edge75.prol
  %.lcssa.unr.ph = phi double [ %19, %._crit_edge75.prol ], [ undef, %._crit_edge75.preheader ]
  %.unr.ph = phi double [ %19, %._crit_edge75.prol ], [ %.pre, %._crit_edge75.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge75.prol ], [ 0, %._crit_edge75.preheader ]
  br label %._crit_edge75.prol.loopexit

._crit_edge75.prol.loopexit:                      ; preds = %._crit_edge75.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %indvars.iv55, 1
  br i1 %20, label %._crit_edge.loopexit, label %._crit_edge75.preheader.new

._crit_edge75.preheader.new:                      ; preds = %._crit_edge75.prol.loopexit
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75, %._crit_edge75.preheader.new
  %21 = phi double [ %.unr.ph, %._crit_edge75.preheader.new ], [ %33, %._crit_edge75 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge75.preheader.new ], [ %indvars.iv.next.1, %._crit_edge75 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond54.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge75

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge75
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge75.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge75.prol.loopexit ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv55
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next56, %indvars.iv71
  br i1 %exitcond62, label %.lr.ph45, label %.preheader

._crit_edge76:                                    ; preds = %._crit_edge76, %.lr.ph45.new
  %38 = phi double [ %.unr81, %.lr.ph45.new ], [ %54, %._crit_edge76 ]
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr, %.lr.ph45.new ], [ %indvars.iv.next64.3, %._crit_edge76 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv63
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %6, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next64.3 = add nuw nsw i64 %indvars.iv63, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next64.3, %indvars.iv71
  br i1 %exitcond70.3, label %._crit_edge46.loopexit.unr-lcssa, label %._crit_edge76

._crit_edge46.loopexit.unr-lcssa:                 ; preds = %._crit_edge76
  br label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %._crit_edge76.prol.loopexit, %._crit_edge46.loopexit.unr-lcssa
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.preheader41
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv71
  %56 = load double, double* %55, align 8
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %55, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 2000
  %indvars.iv.next85 = add i2 %indvars.iv84, 1
  br i1 %exitcond74, label %._crit_edge48, label %.preheader41

._crit_edge48:                                    ; preds = %._crit_edge46
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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %._crit_edge ]
  %indvars.iv20 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv22, 2000
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge26, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge26 ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge26

; <label>:11:                                     ; preds = %._crit_edge27
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge27, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %indvars.iv20
  br i1 %exitcond19, label %._crit_edge, label %._crit_edge27

._crit_edge:                                      ; preds = %._crit_edge26
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond25, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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

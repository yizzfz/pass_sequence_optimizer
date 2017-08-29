; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next17, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv16, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond18, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader152.lr.ph:
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge170, %.preheader152.lr.ph
  %.0171 = phi i32 [ 1, %.preheader152.lr.ph ], [ %151, %._crit_edge170 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge157.us, %.preheader152
  %indvar = phi i64 [ 0, %.preheader152 ], [ %6, %._crit_edge157.us ]
  %indvars.iv176 = phi i64 [ 1, %.preheader152 ], [ %indvars.iv.next177, %._crit_edge157.us ]
  %6 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %scevgep189 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 999
  %scevgep191 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep193 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv176
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv176, -1
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %bound0 = icmp ult double* %scevgep, %scevgep193
  %bound1 = icmp ult double* %scevgep191, %scevgep189
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv.lver.orig
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %13
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next177
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %14
  %.rhs.lver.orig = fmul double %16, 0xC09F400000000001
  %21 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %22 = fdiv double 0x409F400000000001, %21
  store double %22, double* %17, align 8
  %23 = bitcast double* %18 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %27, %26
  %29 = load double, double* %19, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %28, %30
  %32 = load double, double* %20, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %31, %33
  %35 = fdiv double %34, %21
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv.lver.orig
  store double %35, double* %36, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial197 = load double, double* %scevgep191, align 8
  br label %53

._crit_edge157.us:                                ; preds = %.lr.ph156.us
  %exitcond186 = icmp eq i64 %indvars.iv.next177, 999
  br i1 %exitcond186, label %.lver.check213.preheader, label %.lver.check

.lver.check213.preheader:                         ; preds = %._crit_edge157.us
  br label %.lver.check213

.lr.ph156.us:                                     ; preds = %.lr.ph156.us, %._crit_edge.us
  %indvars.iv174 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next175.1, %.lr.ph156.us ]
  %37 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %50, %.lr.ph156.us ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv174
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv174
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv176
  store double %43, double* %44, align 8
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv.next175
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv.next175
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv176
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next175, 1
  %indvars.iv.next175.1 = add nsw i64 %indvars.iv174, -2
  br i1 %52, label %.lr.ph156.us, label %._crit_edge157.us

; <label>:53:                                     ; preds = %53, %.ph
  %store_forwarded198 = phi double [ %load_initial197, %.ph ], [ %70, %53 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %58, %53 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %53 ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %13
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next177
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %57 = fadd double %.rhs, 0x40AF420000000001
  %58 = fdiv double 0x409F400000000001, %57
  store double %58, double* %54, align 8
  %59 = bitcast double* %55 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %59, align 8
  %61 = fmul <2 x double> %60, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = load double, double* %56, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %64, %66
  %68 = fmul double %store_forwarded198, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %57
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv
  store double %70, double* %71, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit222, label %53

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit222:                       ; preds = %53
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit222, %._crit_edge.us.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv176
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph156.us

.lver.check213:                                   ; preds = %.lver.check213.preheader, %._crit_edge167.us
  %indvar199 = phi i64 [ %73, %._crit_edge167.us ], [ 0, %.lver.check213.preheader ]
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %._crit_edge167.us ], [ 1, %.lver.check213.preheader ]
  %73 = add i64 %indvar199, 1
  %scevgep201 = getelementptr [1000 x double], [1000 x double]* %4, i64 %73, i64 0
  %scevgep203 = getelementptr [1000 x double], [1000 x double]* %4, i64 %73, i64 999
  %scevgep205 = getelementptr [1000 x double], [1000 x double]* %5, i64 %73, i64 0
  %scevgep207 = getelementptr [1000 x double], [1000 x double]* %5, i64 %73, i64 999
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 0
  store double 1.000000e+00, double* %74, align 8
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 0
  store double 0.000000e+00, double* %75, align 8
  %76 = bitcast double* %74 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184
  %79 = bitcast [1000 x double]* %78 to i64*
  store i64 %77, i64* %79, align 8
  %80 = add nsw i64 %indvars.iv184, -1
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %bound0209 = icmp ult double* %scevgep201, %scevgep207
  %bound1210 = icmp ult double* %scevgep205, %scevgep203
  %memcheck.conflict212 = and i1 %bound0209, %bound1210
  br i1 %memcheck.conflict212, label %.ph214.lver.orig.preheader, label %.ph214

.ph214.lver.orig.preheader:                       ; preds = %.lver.check213
  br label %.ph214.lver.orig

.ph214.lver.orig:                                 ; preds = %.ph214.lver.orig.preheader, %.ph214.lver.orig
  %indvars.iv178.lver.orig = phi i64 [ %indvars.iv.next179.lver.orig, %.ph214.lver.orig ], [ 1, %.ph214.lver.orig.preheader ]
  %81 = add nsw i64 %indvars.iv178.lver.orig, -1
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %81
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv178.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %80, i64 %indvars.iv178.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %indvars.iv178.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next185, i64 %indvars.iv178.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %81
  %89 = insertelement <2 x double> undef, double %83, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = fmul <2 x double> %90, <double 0xC08F400000000001, double 0xC08F400000000001>
  %92 = fadd <2 x double> %91, <double 0x409F440000000001, double 0x409F440000000001>
  %93 = extractelement <2 x double> %92, i32 0
  %94 = extractelement <2 x double> %92, i32 1
  %95 = fdiv double 0x408F400000000001, %93
  store double %95, double* %84, align 8
  %96 = load double, double* %85, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = load double, double* %86, align 8
  %99 = fmul double %98, 0xC0AF3E0000000001
  %100 = fsub double %99, %97
  %101 = load double, double* %87, align 8
  %102 = fmul double %101, 0xC09F400000000001
  %103 = fsub double %100, %102
  %104 = load double, double* %88, align 8
  %105 = fmul double %104, 0xC08F400000000001
  %106 = fsub double %103, %105
  %107 = fdiv double %106, %94
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv178.lver.orig
  store double %107, double* %108, align 8
  %exitcond181.lver.orig = icmp eq i64 %indvars.iv178.lver.orig, 998
  %indvars.iv.next179.lver.orig = add nuw nsw i64 %indvars.iv178.lver.orig, 1
  br i1 %exitcond181.lver.orig, label %._crit_edge163.us.loopexit, label %.ph214.lver.orig

.ph214:                                           ; preds = %.lver.check213
  %load_initial216 = load double, double* %scevgep201, align 8
  %load_initial219 = load double, double* %scevgep205, align 8
  br label %125

._crit_edge167.us:                                ; preds = %.lr.ph166.us
  %exitcond187 = icmp eq i64 %indvars.iv.next185, 999
  br i1 %exitcond187, label %._crit_edge170, label %.lver.check213

.lr.ph166.us:                                     ; preds = %.lr.ph166.us, %._crit_edge163.us
  %indvars.iv182 = phi i64 [ 998, %._crit_edge163.us ], [ %indvars.iv.next183.1, %.lr.ph166.us ]
  %109 = phi double [ 1.000000e+00, %._crit_edge163.us ], [ %122, %.lr.ph166.us ]
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv182
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %109
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv182
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %indvars.iv182
  store double %115, double* %116, align 8
  %indvars.iv.next183 = add nsw i64 %indvars.iv182, -1
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv.next183
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv.next183
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %indvars.iv.next183
  store double %122, double* %123, align 8
  %124 = icmp sgt i64 %indvars.iv.next183, 1
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, -2
  br i1 %124, label %.lr.ph166.us, label %._crit_edge167.us

; <label>:125:                                    ; preds = %125, %.ph214
  %store_forwarded220 = phi double [ %load_initial219, %.ph214 ], [ %147, %125 ]
  %store_forwarded217 = phi double [ %load_initial216, %.ph214 ], [ %136, %125 ]
  %indvars.iv178 = phi i64 [ 1, %.ph214 ], [ %indvars.iv.next179, %125 ]
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv178
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %80, i64 %indvars.iv178
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %indvars.iv178
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next185, i64 %indvars.iv178
  %130 = insertelement <2 x double> undef, double %store_forwarded217, i32 0
  %131 = shufflevector <2 x double> %130, <2 x double> undef, <2 x i32> zeroinitializer
  %132 = fmul <2 x double> %131, <double 0xC08F400000000001, double 0xC08F400000000001>
  %133 = fadd <2 x double> %132, <double 0x409F440000000001, double 0x409F440000000001>
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %136 = fdiv double 0x408F400000000001, %134
  store double %136, double* %126, align 8
  %137 = load double, double* %127, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = load double, double* %128, align 8
  %140 = fmul double %139, 0xC0AF3E0000000001
  %141 = fsub double %140, %138
  %142 = load double, double* %129, align 8
  %143 = fmul double %142, 0xC09F400000000001
  %144 = fsub double %141, %143
  %145 = fmul double %store_forwarded220, 0xC08F400000000001
  %146 = fsub double %144, %145
  %147 = fdiv double %146, %135
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv178
  store double %147, double* %148, align 8
  %exitcond181 = icmp eq i64 %indvars.iv178, 998
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  br i1 %exitcond181, label %._crit_edge163.us.loopexit221, label %125

._crit_edge163.us.loopexit:                       ; preds = %.ph214.lver.orig
  br label %._crit_edge163.us

._crit_edge163.us.loopexit221:                    ; preds = %125
  br label %._crit_edge163.us

._crit_edge163.us:                                ; preds = %._crit_edge163.us.loopexit221, %._crit_edge163.us.loopexit
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 999
  store double 1.000000e+00, double* %149, align 8
  br label %.lr.ph166.us

._crit_edge170:                                   ; preds = %._crit_edge167.us
  %150 = icmp slt i32 %.0171, 500
  %151 = add nuw nsw i32 %.0171, 1
  br i1 %150, label %.preheader152, label %._crit_edge172

._crit_edge172:                                   ; preds = %._crit_edge170
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv16 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next17, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv16, 1000
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge15
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge15, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond18, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

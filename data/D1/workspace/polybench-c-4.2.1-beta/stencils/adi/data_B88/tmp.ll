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
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv15, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
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
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader152.lr.ph:
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge170, %.preheader152.lr.ph
  %.0171 = phi i32 [ 1, %.preheader152.lr.ph ], [ %152, %._crit_edge170 ]
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
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %74, i64 0, i64 0
  store double 1.000000e+00, double* %75, align 8
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 0
  store double 0.000000e+00, double* %76, align 8
  %77 = bitcast [1000 x double]* %74 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184
  %80 = bitcast [1000 x double]* %79 to i64*
  store i64 %78, i64* %80, align 8
  %81 = add nsw i64 %indvars.iv184, -1
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %bound0209 = icmp ult double* %scevgep201, %scevgep207
  %bound1210 = icmp ult double* %scevgep205, %scevgep203
  %memcheck.conflict212 = and i1 %bound0209, %bound1210
  br i1 %memcheck.conflict212, label %.ph214.lver.orig.preheader, label %.ph214

.ph214.lver.orig.preheader:                       ; preds = %.lver.check213
  br label %.ph214.lver.orig

.ph214.lver.orig:                                 ; preds = %.ph214.lver.orig.preheader, %.ph214.lver.orig
  %indvars.iv178.lver.orig = phi i64 [ %indvars.iv.next179.lver.orig, %.ph214.lver.orig ], [ 1, %.ph214.lver.orig.preheader ]
  %82 = add nsw i64 %indvars.iv178.lver.orig, -1
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %82
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv178.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %81, i64 %indvars.iv178.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %indvars.iv178.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next185, i64 %indvars.iv178.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %82
  %90 = insertelement <2 x double> undef, double %84, i32 0
  %91 = shufflevector <2 x double> %90, <2 x double> undef, <2 x i32> zeroinitializer
  %92 = fmul <2 x double> %91, <double 0xC08F400000000001, double 0xC08F400000000001>
  %93 = fadd <2 x double> %92, <double 0x409F440000000001, double 0x409F440000000001>
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %96 = fdiv double 0x408F400000000001, %94
  store double %96, double* %85, align 8
  %97 = load double, double* %86, align 8
  %98 = fmul double %97, 0xC09F400000000001
  %99 = load double, double* %87, align 8
  %100 = fmul double %99, 0xC0AF3E0000000001
  %101 = fsub double %100, %98
  %102 = load double, double* %88, align 8
  %103 = fmul double %102, 0xC09F400000000001
  %104 = fsub double %101, %103
  %105 = load double, double* %89, align 8
  %106 = fmul double %105, 0xC08F400000000001
  %107 = fsub double %104, %106
  %108 = fdiv double %107, %95
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv178.lver.orig
  store double %108, double* %109, align 8
  %exitcond181.lver.orig = icmp eq i64 %indvars.iv178.lver.orig, 998
  %indvars.iv.next179.lver.orig = add nuw nsw i64 %indvars.iv178.lver.orig, 1
  br i1 %exitcond181.lver.orig, label %._crit_edge163.us.loopexit, label %.ph214.lver.orig

.ph214:                                           ; preds = %.lver.check213
  %load_initial216 = load double, double* %scevgep201, align 8
  %load_initial219 = load double, double* %scevgep205, align 8
  br label %126

._crit_edge167.us:                                ; preds = %.lr.ph166.us
  %exitcond187 = icmp eq i64 %indvars.iv.next185, 999
  br i1 %exitcond187, label %._crit_edge170, label %.lver.check213

.lr.ph166.us:                                     ; preds = %.lr.ph166.us, %._crit_edge163.us
  %indvars.iv182 = phi i64 [ 998, %._crit_edge163.us ], [ %indvars.iv.next183.1, %.lr.ph166.us ]
  %110 = phi double [ 1.000000e+00, %._crit_edge163.us ], [ %123, %.lr.ph166.us ]
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv182
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, %110
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv182
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %indvars.iv182
  store double %116, double* %117, align 8
  %indvars.iv.next183 = add nsw i64 %indvars.iv182, -1
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv.next183
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %116
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv.next183
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %indvars.iv.next183
  store double %123, double* %124, align 8
  %125 = icmp sgt i64 %indvars.iv.next183, 1
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, -2
  br i1 %125, label %.lr.ph166.us, label %._crit_edge167.us

; <label>:126:                                    ; preds = %126, %.ph214
  %store_forwarded220 = phi double [ %load_initial219, %.ph214 ], [ %148, %126 ]
  %store_forwarded217 = phi double [ %load_initial216, %.ph214 ], [ %137, %126 ]
  %indvars.iv178 = phi i64 [ 1, %.ph214 ], [ %indvars.iv.next179, %126 ]
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv178
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %81, i64 %indvars.iv178
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %indvars.iv178
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next185, i64 %indvars.iv178
  %131 = insertelement <2 x double> undef, double %store_forwarded217, i32 0
  %132 = shufflevector <2 x double> %131, <2 x double> undef, <2 x i32> zeroinitializer
  %133 = fmul <2 x double> %132, <double 0xC08F400000000001, double 0xC08F400000000001>
  %134 = fadd <2 x double> %133, <double 0x409F440000000001, double 0x409F440000000001>
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %137 = fdiv double 0x408F400000000001, %135
  store double %137, double* %127, align 8
  %138 = load double, double* %128, align 8
  %139 = fmul double %138, 0xC09F400000000001
  %140 = load double, double* %129, align 8
  %141 = fmul double %140, 0xC0AF3E0000000001
  %142 = fsub double %141, %139
  %143 = load double, double* %130, align 8
  %144 = fmul double %143, 0xC09F400000000001
  %145 = fsub double %142, %144
  %146 = fmul double %store_forwarded220, 0xC08F400000000001
  %147 = fsub double %145, %146
  %148 = fdiv double %147, %136
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv184, i64 %indvars.iv178
  store double %148, double* %149, align 8
  %exitcond181 = icmp eq i64 %indvars.iv178, 998
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  br i1 %exitcond181, label %._crit_edge163.us.loopexit221, label %126

._crit_edge163.us.loopexit:                       ; preds = %.ph214.lver.orig
  br label %._crit_edge163.us

._crit_edge163.us.loopexit221:                    ; preds = %126
  br label %._crit_edge163.us

._crit_edge163.us:                                ; preds = %._crit_edge163.us.loopexit221, %._crit_edge163.us.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 999
  store double 1.000000e+00, double* %150, align 8
  br label %.lr.ph166.us

._crit_edge170:                                   ; preds = %._crit_edge167.us
  %151 = icmp slt i32 %.0171, 500
  %152 = add nuw nsw i32 %.0171, 1
  br i1 %151, label %.preheader152, label %._crit_edge172

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
  %indvars.iv15 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next16, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge14
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge14, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
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
